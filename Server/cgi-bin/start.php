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
      <TR><TH><Center><font color=#FFFFFF>Smart Remote Control v1.01</font></Center>
      </table> 
      <TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>
      <TR><TD><a href='/cgi-bin/start.php'>Главная</а>
           <TD><a href='/cgi-bin/wifi.php'>WiFi</а>
           <TD><a href='/cgi-bin/3g.php'>3G</а>
           <TD><a href='/cgi-bin/ddns.php'>DDNS</а>
           <TD><a href='/cgi-bin/passw.php'>Пользователи</а>
           <TD><a href='/cgi-bin/update.php'>Обновление</а>
           <TD><a href='/cgi-bin/logout.php'>Выход</а>
       </table> ");
echo("<TABLE border='0' cellpadding='5' cellspacing='0'>
      <TR><TD><form action=/cgi-bin/renew_all.php method=post>
           <input type=hidden name='web_ipaddr' value=$broadcast_ip>");
echo("     <input type=hidden name='web_portno' value=$client_port>");
echo("     <input type=hidden name='web_mess' value='update_all_tables'>
           <input type=submit value='Обновить список устройств ...'>
           </form>
      </table> <br>");
$dbcnx=mysql_connect("127.0.0.1",$userdb,$passdb) or die("<html><BODY BGCOLOR=#4A6B7C>
                                                    <Script Language='JavaScript'>
                                                    alert('Data Base error.')
                                                    </Script></BODY></html>");
mysql_select_db($name_db);
$zapros = mysql_query("SELECT * FROM Devices order by obtaine_ip asc");

$num_dev="0";
while ($res = mysql_fetch_array($zapros))
{
$num_dev++;

echo("<TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>");
echo("<tr><td BGCOLOR=#FF99FF colspan=3>$res[module_name]</td></tr> ");
echo("<tr><td align='center'><font color=#FF0000><B>Устройство № $num_dev</B></font><form action=/cgi-bin/renew_device.php method=post>
                 <input type=hidden name='web_ipaddr' value=$res[obtaine_ip]>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='web_mess' value='update_all_tables'>
                 <input type=submit value='Обновить состояние'>
                 </form></td>");               
echo("<td><font color=#FF0000><B>IP - $res[obtaine_ip]</B></font><br>Последнее обновление -<br>$res[timestamp]</td> ");
echo("<td><a href='/cgi-bin/dev_info.php?obtaine_ip=$res[obtaine_ip]'>Дополнительная<br>информация ...</а></td> ");
echo("</tr></table>");

$substr = "Relay";
if (strstr($res[module_func], $substr))
   {
    echo("<TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>");
    echo("<tr><td BGCOLOR=#CC99FF colspan=6><font color=#FF0000><B>Устройство № $num_dev</B></font> - Управление реле</td></tr> ");
    echo("<tr><td>Номер<br>реле<td>Состояние<td>Время до<br>выключения<td>Включение<br>Таймер=0 - вкл. постоянно<td>Отключение<td>Название подключенного<br>устройства");
    echo("<tr>");
    $zapros2 = mysql_query("SELECT * FROM Relay WHERE obtaine_ip='$res[obtaine_ip]'");
    $res2 = mysql_fetch_array($zapros2);
    if ($res2[relay_state]==""){}else{
    $arra = explode(";", $res2[relay_state]);
    $arra2 = explode(";", $res2[relay_time]);
    $arra3 = explode(";", $res2[relay_name]);
    $num=0;
    foreach ($arra as $value) {
                              $dem = explode("+", $value);
                              echo("<td>Реле $dem[0]");
                              if ($dem[1]=="1") {echo("<td BGCOLOR=#FF0000>Включено");}
                                                else {echo("<td BGCOLOR=#FFCC00>Выключено");}
                              $dem2=explode("+",$arra2[$num]);
                              echo("<td>$dem2[1] минут");                       
                              $dem3=explode("+",$arra3[$num]);
                              
                              
                              
                              echo("<td><form action=/cgi-bin/send_udp_relay.php method=post>
                 <input type=hidden name='web_ipaddr' value=$res[obtaine_ip]>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='web_mess' value=Relay+$dem[0]+ON>
                 Таймер автоотключения<br><input type=number min='0' max='255' size='4' name='time' value='0'>минут
                 <input type=submit value='Включить'>
                 </form>");
                              echo("<td><form action=/cgi-bin/send_udp_relay.php method=post>
                 <input type=hidden name='web_ipaddr' value=$res[obtaine_ip]>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='web_mess' value=Relay+$dem[0]+OFF>
                 <input type=submit value='Отключить'>
                 </form>");
                              
                              echo("<td>$dem3[1]");
                              echo("<tr>");
                              $num++;
                              }
                              }
                              echo("</tr></table><br>");
                              }


}





echo(" </body></html> ");  
mysql_close($dbcnx);
?>
