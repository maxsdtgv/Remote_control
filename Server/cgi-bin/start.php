<?php
session_start();
if ($_SESSION["nnn"]=="" && $_SESSION["ppp"]=="") header("Location: /index.html");
$broadcast_ip=$_SESSION["broadcast_ip"];
$network_ip=$_SESSION["network_ip"];
$network_mask=$_SESSION["network_mask"];
$server_port=$_SESSION["server_port"];
$client_port=$_SESSION["client_port"];
$userdb = $_SESSION["nnn"];
$passdb = $_SESSION["ppp"];
$name_db=$_SESSION["name_db"];

echo("<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html> <head> <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<TITLE>SmartRemoteControl</TITLE></HEAD>");

echo("<body BGCOLOR=#4A6B7C>
      <TABLE border='0' cellpadding='5' cellspacing='0'>
      <TR><TH><font size='5' color=#CCFFFF>SmartRemoteControl v1.01</font>
      </table>
      <TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>
      <TR><TD><a href='/cgi-bin/start.php'>Главная</а>
           <TD><a href='/cgi-bin/wifi.php'>WiFi</а>
           <TD><a href='/cgi-bin/3g.php'>3G</а>
           <TD><a href='/cgi-bin/ddns.php'>DDNS</а>
           <TD><a href='/cgi-bin/passw.php'>Пользователи</а>
           <TD><a href='/cgi-bin/update.php'>Обновление</а>
           <TD><a href='/cgi-bin/logout.php'>Выход</а>
      </table>
      <TABLE border='0' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>
      <TR><TD colspan='7' BGCOLOR=#4A6B7C><form action=/cgi-bin/renew_all.php method=post>
           <input type=hidden name='web_ipaddr' value=$broadcast_ip>");
echo("     <input type=hidden name='web_portno' value=$client_port>");
echo("     <input type=hidden name='web_mess' value='update_all_tables'>
           <input type=submit value='Обновить список всех модулей в сети ...'>
           </form>
      </table><br><font size='4' color=#CCFFFF>Список найденных модулей</font><br>");
$dbcnx=mysql_connect("127.0.0.1",$userdb,$passdb) or die("<html><BODY BGCOLOR=#4A6B7C>
                                                    <Script Language='JavaScript'>
                                                    alert('Data Base error.')
                                                    </Script></BODY></html>");
mysql_select_db($name_db);
$zapros = mysql_query("SHOW TABLES");
while ($res = mysql_fetch_array($zapros)){
                                         $zapros2 = mysql_query("TRUNCATE TABLE $res[0]");
                                         }
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        $sock_data = socket_set_option($sock, SOL_SOCKET, SO_BROADCAST, 1);
        $sock_data = socket_connect($sock, $broadcast_ip, $client_port);
        $module_mess="update_all_tables";
        $len_pack = strlen($module_mess);
        $sock_data = socket_write($sock, $module_mess, $len_pack);
        socket_close($sock);
sleep(1);

$zapros = mysql_query("SELECT * FROM Devices order by obtaine_ip asc");

$num_dev="0";
while ($res = mysql_fetch_array($zapros))
{
$num_dev++;

echo("<TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>");
echo("<tr BGCOLOR=#FDE0FE><th>Модуль № $num_dev.");
$res[module_name] = mb_convert_encoding ($res[module_name] ,"UTF-8" ,"Windows-1251");
echo("<th>Имя модуля - <br>$res[module_name]<br>(<a href='/cgi-bin/dev_info.php?obtaine_ip=$res[obtaine_ip]'>изменить имя</a>)");
echo("<th>IP - $res[obtaine_ip]");
//echo("</tr></table>");
///================= Relay============================================
$substr = "Temp";
if (strstr($res[module_func], $substr)){
                                        echo("<tr><th><center>Температура</center>");
                                        $zapros2 = mysql_query("SELECT * FROM Temp WHERE obtaine_ip='$res[obtaine_ip]'");
                                        $res2 = mysql_fetch_array($zapros2);
                                        if ($res2[temp_state]==""){
                                        	                        echo("<tr><td colspan=3>ОШИБКА! Нет доступа к данной функциональности.");}
                                        else{
                                        $temp = (($res2[temp_state]*3.19)-500)*0.1;
                                        $temp=round($temp,1);
                                        echo("<td colspan=2>$temp &ordm;C");
                              }

                              }

//================= Relay============================================
$substr = "Relay";
if (strstr($res[module_func], $substr)){
                                        echo("<tr><th rowspan='2' BGCOLOR=#DFFEFF><a href='/cgi-bin/relay_onoff.php?obtaine_ip=$res[obtaine_ip]'>Перейти к управлению<br>реле</a>");
                                        $zapros2 = mysql_query("SELECT * FROM Relay WHERE obtaine_ip='$res[obtaine_ip]'");
                                        $res2 = mysql_fetch_array($zapros2);
                                        if ($res2[relay_state]==""){
                                        	                        echo("<tr><td colspan=3>ОШИБКА! Нет доступа к данной функциональности.");}
                                        else{
                                        $arra = explode(";", $res2[relay_state]);
                                        $relay_on=0;
                                        $relay_off=0;
                               foreach ($arra as $value) {
                                                          $dem = explode("+", $value);
                                                          if ($dem[1]=="1") {$relay_on++;}
                                                          if ($dem[1]=="0") {$relay_off++;}
                                                         }
    if ($relay_on==0){echo("<td colspan='2'>Включено - 0 реле");}else{echo("<td colspan='2' BGCOLOR=#FF404F>Включено - $relay_on реле");}
    if ($relay_off==0){echo("<tr><td colspan='2'>Отключено - 0 реле");}else{echo("<tr><td colspan='2' BGCOLOR=#40FF58>Отключено - $relay_off реле");}
                              }
                              //echo("</table>");
                              }
//========================= GSM================================================
$substr = "GSM";
if (strstr($res[module_func], $substr)){
                                        echo("<tr><th rowspan='3' BGCOLOR=#DFFEFF><a href='/cgi-bin/gsm_info.php?obtaine_ip=$res[obtaine_ip]'>Перейти к управлению<br>SMS оповещением</a>");
                                        $zapros2 = mysql_query("SELECT * FROM GSM WHERE obtaine_ip='$res[obtaine_ip]'");
                                        $res2 = mysql_fetch_array($zapros2);
                                        if ($res2[call_num]==""){
                                        	                        echo("<tr><td colspan=3>ОШИБКА! Нет доступа к данной функциональности.");}
                                        else{
                                             if ($res2[signal]=="1"){echo("<td  BGCOLOR=#4096FF>SMS оповещение<br>включено");}else{echo("<td>SMS оповещение<br>отключено");}
                                             if ($res2[signal]=="1"){    echo("<FORM action=/cgi-bin/send_udp_new_info.php method=post>
                                             <input type=hidden name='web_ipaddr' value=$res[obtaine_ip]>
                                             <input type=hidden name='web_portno' value=$client_port>
                                             <input type=hidden name='page_return' value=start.php>
                                             <input type=hidden name='param' value=signal>
                                             <input type=hidden name='value' value=OFF><br>
                                             <input type=submit value='Отключить SMS оповещение'></FORM>");}
                                             else {echo("<FORM action=/cgi-bin/send_udp_new_info.php method=post>
                                             <input type=hidden name='web_ipaddr' value=$res[obtaine_ip]>
                                             <input type=hidden name='web_portno' value=$client_port>
                                             <input type=hidden name='page_return' value=start.php>
                                             <input type=hidden name='param' value=signal>
                                             <input type=hidden name='value' value=ON><br>
                                             <input type=submit value='Включить SMS оповещение'></FORM>");}

    //====================
                                                 if ($res2[auto_answer]=="1"){echo("<td  BGCOLOR=#4096FF>Автоответ входящих<br>включено");}else{echo("<td>Автоответ входящих<br>отключено");}
                                             if ($res2[auto_answer]=="1"){    echo("<FORM action=/cgi-bin/send_udp_new_info.php method=post>
                                             <input type=hidden name='web_ipaddr' value=$res[obtaine_ip]>
                                             <input type=hidden name='web_portno' value=$client_port>
                                             <input type=hidden name='page_return' value=start.php>
                                             <input type=hidden name='param' value=auto_answer>
                                             <input type=hidden name='value' value=OFF><br>
                                             <input type=submit value='Отключить Автоответ входящих'></FORM>");}
                                             else {echo("<FORM action=/cgi-bin/send_udp_new_info.php method=post>
                                             <input type=hidden name='web_ipaddr' value=$res[obtaine_ip]>
                                             <input type=hidden name='web_portno' value=$client_port>
                                             <input type=hidden name='page_return' value=start.php>
                                             <input type=hidden name='param' value=auto_answer>
                                             <input type=hidden name='value' value=ON><br>
                                             <input type=submit value='Включить Автоответ входящих'></FORM>");}

    //====================

                                             $arra = explode(";", $res2[call_num]);
                                             $num=1;
                              echo("<tr><td>Номера отправки SMS:<td>");
    foreach ($arra as $value) {
                              if ($value=="F") {echo("№$num Не назначено.<br>");} else {echo("№$num $value<br>");}
                              $num++;}
                              }}
  //==================== Alarm ======================
$substr = "Signal";
if (strstr($res[module_func], $substr)){
                                        echo("<tr><tr><th rowspan='2' BGCOLOR=#DFFEFF><a href='/cgi-bin/alarm_display.php?obtaine_ip=$res[obtaine_ip]'>Перейти к управлению<br>датчиками</a>");
                                        $zapros2 = mysql_query("SELECT * FROM Signal WHERE obtaine_ip='$res[obtaine_ip]'");
                                        $res2 = mysql_fetch_array($zapros2);
                                        if ($res2[alarm_state]==""){
                                        	                        echo("<tr><td colspan=3>ОШИБКА! Нет доступа к данной функциональности.");}
                                        else{
                                        $arra = explode(";", $res2[alarm_state]);
                                        $alarm_on=0;
                                        $alarm_off=0;
                               foreach ($arra as $value) {
                                                          $dem = explode("+", $value);
                                                          //$temp=atoi($dem[1]);
                                                          if ($dem[1]>500) {$alarm_on++;}
                                                          else {$alarm_off++;}
                                                         }
    if ($alarm_on==0){echo("<td colspan='2'>Разомкнуто - 0 линий");}else{echo("<td colspan='2' BGCOLOR=#FF404F>Разомкнуто - $alarm_on линий");}
    if ($alarm_off==0){echo("<tr><td colspan='2'>Замкнуто - 0 линий");}else{echo("<tr><td colspan='2' BGCOLOR=#40FF58>Замкнуто - $alarm_off линий");}




                              }}







   echo("</tr></table><br>");
}







echo(" </body></html> ");
mysql_close($dbcnx);
?>