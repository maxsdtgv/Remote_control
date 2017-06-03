<?PHP
session_start();
if ($_SESSION['nnn']=='' && $_SESSION['ppp']=='') header("Location: /index.html");
#======== Socket config ===================================
$module_ip = $_GET['obtaine_ip'];
$userdb = $_SESSION['nnn'];
$passdb = $_SESSION['ppp'];
$name_db=$_SESSION['name_db'];
$client_port=$_SESSION["client_port"];
//=================================================
$dbcnx=mysql_connect("127.0.0.1",$userdb,$passdb) or die("<html><BODY BGCOLOR=#4A6B7C>
                                                    <Script Language='JavaScript'>
                                                    alert('Data Base error.')
                                                    </Script></BODY></html>");
mysql_select_db($name_db);
//===============================================================
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
       </table><br> ");
//=================================================================
//=====================================================================
    $zapros2 = mysql_query("SELECT * FROM Signal WHERE obtaine_ip='$module_ip'");
    $res2 = mysql_fetch_array($zapros2);
    $zapros8 = mysql_query("SELECT * FROM Relay WHERE obtaine_ip='$module_ip'");
    $res8 = mysql_fetch_array($zapros8);
    echo("<TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>");
    echo("<tr><td colspan='6' BGCOLOR=#CCFFFF>Состояние линий для подключения датчиков. IP - $module_ip<form action=/cgi-bin/send_udp.php method=post>
                 <input type=hidden name='web_ipaddr' value=$module_ip>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='page_return' value=alarm_display.php?obtaine_ip=$module_ip>
                 <input type=hidden name='web_mess' value='update_Signal'>
                 <input type=hidden name='timeout' value='1'>
                 <input type=submit value='Обновить состояние'>
                 </form>");
    echo("<tr><td>Линия<td>Состояние<td>Отправка SMS<td>Имя линии<td colspan=2>Включение реле на время");
    if ($res2[alarm_state]==""){}else{
    $arra = explode(";", $res2[alarm_state]);
    $arra2 = explode(";", $res2[alarm_relay]);
    $arra3 = explode(";", $res2[alarm_name]);
    $arra4 = explode(";", $res2[armed]);
    $arra8 = explode(";", $res8[relay_name]);
    $num=0;
    foreach ($arra as $value) {
                              $dem = explode("+", $value);
                              echo("<tr><td>Линия $dem[0]");
                              if ($dem[1]>500) {$ss=o;}else {$ss=1;}

    if ($ss==0){echo("<td BGCOLOR=#FF404F>Линия разомкнута<br>($dem[1])");}else{echo("<td BGCOLOR=#40FF58>Линия замкнута<br>($dem[1])");}
                                            $zapros9 = mysql_query("SELECT * FROM GSM WHERE obtaine_ip='$module_ip'");
                                        $res9 = mysql_fetch_array($zapros9);
    if ($res9[signal]=="1"){
    $dem4 = explode("+", $arra4[$num]);
    if ($dem4[1]=="0") {echo("<td BGCOLOR=#F7C257>Датчик сработал,<br>отправлено SMS");}else{echo("<td>Контроль");}
                              }else
                              {echo("<td>Сигнализация<br>отключена");}

                              $dem3=explode("+",$arra3[$num]);
                              $dem3[1] = mb_convert_encoding ($dem3[1] ,"UTF-8" ,"Windows-1251");
                              echo("<td>$dem3[1] <br>(<a href='/cgi-bin/alarm_info.php?obtaine_ip=$res2[obtaine_ip]'>изменить</a>)");

                              $dem2=explode("+",$arra2[$num]);

                              $dem8=explode("+",$arra8[$num]);
                              $dem8[1]= mb_convert_encoding ($dem8[1],"UTF-8" ,"Windows-1251");


                              echo("<td>Реле $dem8[0]<br> $dem8[1] <br>на $dem2[1] секунд");
                                                            echo("<td><form action=/cgi-bin/send_udp_alarm.php method=post>
                 <input type=hidden name='web_ipaddr' value=$res2[obtaine_ip]>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='web_mess' value=Alarm+$dem8[0]>
                 Установить значение<br><input type=number min='-1' max='255' size='6' name='time' value='0'>секунд
                 <input type=submit value='Установить'>
                 </form>");
                              $num++;
                              }
                              }
                              echo("</tr></table>");








mysql_close($dbcnx);
echo(" </body></html> ");
?>
