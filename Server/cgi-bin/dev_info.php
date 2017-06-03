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
$zapros = mysql_query("SELECT * FROM Devices Where obtaine_ip='$module_ip'");
$res = mysql_fetch_array($zapros);
echo("<TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>");
echo("<tr><td colspan='2' BGCOLOR=#CCFFFF>Дополнительная информация об устройстве</td></tr> ");
if ($res[obtaine_ip]==""){echo("<tr><td colspan='2'>Нет ответа от устройства $module_ip</table> ");}else{

echo("<tr><td>IP адрес устройства<td BGCOLOR=#FF99FF>$res[obtaine_ip]</td></tr> ");
echo("<tr><td>MAC адрес устройства<td>$res[module_mac]</td></tr> ");
echo("<tr><td>Hardware version<td>$res[hw_ver]</td></tr> ");
//echo("<tr><td>Описание устройства<td>$res[module_info]</td></tr> ");
echo("<tr><td>Функциональность<td>");
                                                  $substr = "Relay";
                                                  if (strstr($res[module_func], $substr)){echo("Управление реле<br> "); }
                                                  $substr = "Signal";
                                                  if (strstr($res[module_func], $substr)){echo("Сигнализация<br> "); }
                                                  $substr = "GSM";
                                                  if (strstr($res[module_func], $substr)){echo("Функции GSM<br> "); }
                                                  $substr = "Temp";
                                                  if (strstr($res[module_func], $substr)){echo("Датчик температуры"); }
                                                  echo(" </td></tr> ");
$res[module_name] = mb_convert_encoding ($res[module_name] ,"UTF-8" ,"Windows-1251");
echo("<tr><td>Имя утройства<td>$res[module_name]</td></tr> ");
echo("<tr><td>Изменить имя устройства");
    echo("<td><FORM action=/cgi-bin/send_udp_new_info.php method=post>
              <input type=hidden name='web_ipaddr' value=$module_ip>
              <input type=hidden name='web_portno' value=$client_port>
              <input type=hidden name='page_return' value=dev_info.php?obtaine_ip=$module_ip>
              <input type=hidden name='param' value=module_name>
              <input type=text name=value><br>
              <input type=submit value='Сохранить новое имя'></FORM></td></tr> ");
echo("</TABLE>");





}
mysql_close($dbcnx);
echo(" </body></html> ");
?>
