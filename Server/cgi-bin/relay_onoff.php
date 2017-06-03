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
$obtaine_ip=$_GET["obtaine_ip"];

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
            </table><br>");
$dbcnx=mysql_connect("127.0.0.1",$userdb,$passdb) or die("<html><BODY BGCOLOR=#4A6B7C>
                                                    <Script Language='JavaScript'>
                                                    alert('Data Base error.')
                                                    </Script></BODY></html>");
mysql_select_db($name_db);
    $zapros = mysql_query("SELECT * FROM Devices WHERE obtaine_ip='$obtaine_ip'");
    $res = mysql_fetch_array($zapros);



    echo("<TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>");
    $res[module_name] = mb_convert_encoding ($res[module_name] ,"UTF-8" ,"Windows-1251");
    echo("<tr><td BGCOLOR=#CC99FF colspan=6>Управление реле модуля - $res[module_name]. IP - $obtaine_ip<form action=/cgi-bin/send_udp_relay.php method=post>
                 <input type=hidden name='web_ipaddr' value=$obtaine_ip>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='web_mess' value='update_Relay'>
                 <input type=submit value='Обновить состояние'>
                 </form>");

    $zapros2 = mysql_query("SELECT * FROM Relay WHERE obtaine_ip='$obtaine_ip'");
    $res2 = mysql_fetch_array($zapros2);
    if ($res2[relay_state]==""){echo("<tr><td colspan=6>ОШИБКА! Нет доступа к данной функциональности.");}else{
    echo("<tr><td>№<td>Состояние<td>Время до<br>выключения<td>Установка таймера<br>отключения на время<td>Срочное отключение<td>Подключенное<br>устройство");
    echo("<tr>");
    $arra = explode(";", $res2[relay_state]);
    $arra2 = explode(";", $res2[relay_time]);
    $arra3 = explode(";", $res2[relay_name]);
    $num=0;
    foreach ($arra as $value) {
                              $dem = explode("+", $value);
                              echo("<td>Реле $dem[0]");
                              if ($dem[1]=="1") {echo("<td BGCOLOR=#FF0000>Включено");}
                                                else {echo("<td BGCOLOR=#40FF58>Выключено");}
                              $dem2=explode("+",$arra2[$num]);
                              if ($dem2[1]=="-1"){$dem_min=$dem2[1];}else{$dem_min=$dem2[1]/60;
                                                        $dem_min = round($dem_min,1);
                                                       }

                              echo("<td>$dem_min минут");




                              echo("<td><form action=/cgi-bin/send_udp_relay.php method=post>
                 <input type=hidden name='web_ipaddr' value=$res[obtaine_ip]>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='web_mess' value=Relay+$dem[0]+ON>
                 Таймер автоотключения<br><input type=number min='-1' max='86400' size='6' name='time' value='0'>минут
                 <input type=submit value='Включить'>
                 </form>");
                              echo("<td><center><form action=/cgi-bin/send_udp_relay.php method=post>
                 <input type=hidden name='web_ipaddr' value=$res[obtaine_ip]>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='web_mess' value=Relay+$dem[0]+OFF>
                 <input type=submit value='Отключить'>
                 </form>");
                              $dem3=explode("+",$arra3[$num]);
                              $dem3[1] = mb_convert_encoding ($dem3[1] ,"UTF-8" ,"Windows-1251");
                              echo("<td>$dem3[1] (<a href='/cgi-bin/relay_info.php?obtaine_ip=$res[obtaine_ip]'>изменить</a>)");
                              echo("<tr>");
                              $num++;
                              }
                              }
                              echo("</tr></table>");










echo(" </body></html> ");
mysql_close($dbcnx);
?>