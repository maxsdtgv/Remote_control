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
    echo("<TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>");
    echo("<tr><td colspan='3' BGCOLOR=#CCFFFF>Название линий сигнализации для устройства $module_ip</td></tr> ");
    echo("<tr><td>Линии<td>Название линии<td>Изменение названия</tr> ");
    if ($res2[alarm_state]==""){}else{
    $arra = explode(";", $res2[alarm_state]);
    $arra2 = explode(";", $res2[alarm_name]);
    $num=0;
    foreach ($arra as $value) {
                              $dem = explode("+", $value);
                              echo("<tr><td>Линия $dem[0]");

                              $dem2=explode("+",$arra2[$num]);
                              $dem2[1] = mb_convert_encoding ($dem2[1] ,"UTF-8" ,"Windows-1251");
                              echo("<td>$dem2[1]");

                              echo("<td><form action=/cgi-bin/send_udp_new_info.php method=post>
                 <input type=hidden name='web_ipaddr' value=$module_ip>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='page_return' value=alarm_info.php?obtaine_ip=$module_ip>
                 <input type=hidden name='param' value=$dem[0]>
                 <input type=text name=value><br>
                 <input type=submit value='Сохранить для $dem[0]'>
                 </form>");


                              $num++;
                              }
                              }
                              echo("</tr></table>");








mysql_close($dbcnx);
echo(" </body></html> ");
?>
