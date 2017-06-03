<?PHP
session_start();
if ($_SESSION['nnn']=='' && $_SESSION['ppp']=='') header("Location: /index.html");
#======== Socket config ===================================
$module_ip = $_GET['obtaine_ip'];
$broadcast_ip=$_SESSION["broadcast_ip"];
$network_ip=$_SESSION["network_ip"];
$network_mask=$_SESSION["network_mask"];
$server_port=$_SESSION["server_port"];
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

//==========================================================================

    $zapros2 = mysql_query("SELECT * FROM GSM WHERE obtaine_ip='$module_ip'");
               mysql_query("UPDATE GSM SET ussd = '' WHERE obtaine_ip='$module_ip'");
    $res2 = mysql_fetch_array($zapros2);
    if ($res2[call_num]==""){}else{
    echo("<TABLE border='1' cellpadding='5' cellspacing='0' BGCOLOR=#FFFFFF>");
    echo("<tr><td colspan='3' BGCOLOR=#CCFFFF>Изменение параметров GSM модуля для устройства $module_ip");
    echo("<tr><td>Параметр<td>Зачение<td>Изменение значения");

    $arra = explode(";", $res2[call_num]);
    $num=1;
    foreach ($arra as $value) {
                              echo("<tr><td>Номер отправки SMS, № $num");
                              if ($value=="F") {echo("<td>Не назначено.");} else {echo("<td>$value");}
                              if ($num==1) {$num1=$value;}
                              echo("<td><form action=/cgi-bin/send_udp_new_info.php method=post>
                 <input type=hidden name='web_ipaddr' value=$module_ip>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='page_return' value=gsm_info.php?obtaine_ip=$module_ip>
                 <input type=hidden name='param' value='call_num$num'>
                 <input type=text name=value><br>
                 <input type=submit value='Сохранить для номер $num'>
                 </form>");
                              $num++;
                              }
                       echo("<tr><td colspan=3><center>Отправить тестовое SMS");
                              echo("<form action=/cgi-bin/send_udp_new_info.php method=post>
                 <input type=hidden name='web_ipaddr' value=$module_ip>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='page_return' value=gsm_info.php?obtaine_ip=$module_ip>
                 <input type=hidden name='param' value='sms'>
                 <input type=hidden name='value' value='Тест отправки SMS.'>
                 <input type=submit value='Отправить SMS'>
                 </form>");
        echo("<tr><td>PIN код");
        if ($res2[pin]=="F") {echo("<td>Не назначено.");} else {echo("<td>$res2[pin]");}
    echo("<td><FORM action=/cgi-bin/send_udp_new_info.php method=post>
              <input type=hidden name='web_ipaddr' value=$module_ip>
              <input type=hidden name='web_portno' value=$client_port>
              <input type=hidden name='page_return' value=gsm_info.php?obtaine_ip=$module_ip>
              <input type=hidden name='param' value=pin>
              <input type=text name=value><br>
              <input type=submit value='Сохранить новый PIN код'></FORM></td></tr> ");

    echo("<tr><td colspan='3' BGCOLOR=#CCFFFF>Тестовые функции GSM модуля");
                              echo("<tr><td>Выполнить АТ команду.<br>");
                              echo("<form action=/cgi-bin/send_udp_new_info.php method=post>
                 <input type=hidden name='web_ipaddr' value=$module_ip>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='page_return' value=gsm_info.php?obtaine_ip=$module_ip>
                 <input type=hidden name='param' value='at'>
                 <input type=text name=value><br>
                 <input type=submit value='Выполнить'>
                 </form>");
                              echo("<td>Выполнить USSD запрос.<br>Например *111#");
                              echo("<form action=/cgi-bin/send_udp_new_info.php method=post>
                 <input type=hidden name='web_ipaddr' value=$module_ip>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='page_return' value=gsm_info.php?obtaine_ip=$module_ip>
                 <input type=hidden name='param' value='ussd'>
                 <input type=text name=value><br>
                 <input type=submit value='Выполнить'>
                 </form>");


               echo("<td><center>Тестовый вызов<br>на номер №1<br>$num1");
                              echo("<form action=/cgi-bin/send_udp_new_info.php method=post>
                 <input type=hidden name='web_ipaddr' value=$module_ip>
                 <input type=hidden name='web_portno' value=$client_port>
                 <input type=hidden name='page_return' value=gsm_info.php?obtaine_ip=$module_ip>
                 <input type=hidden name='param' value='call'>
                 <input type=hidden name='value' value='ON'>
                 <input type=submit value='Выполнить вызов'>
                 </form>");
               echo("<tr><td>Результат запроса ->");
                if ($res2[ussd]==""){echo("<td BGCOLOR=#FF99FF colspan=2>Результат выбраного действия будет отображен здесь.");}else{echo("<td BGCOLOR=#FF99FF colspan=2>$res2[ussd]");}


     mysql_query("DELETE FROM GSM WHERE obtaine_ip='$module_ip'");
$module_data="new+at=AT+COPS?";
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        $sock_data = socket_connect($sock, $module_ip, $client_port);
        $len_pack = strlen($module_data);
        $sock_data = socket_write($sock, $module_data, $len_pack);
        socket_close($sock);
        sleep(1);
$module_data="update_GSM";
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        $sock_data = socket_connect($sock, $module_ip, $client_port);
        $len_pack = strlen($module_data);
        $sock_data = socket_write($sock, $module_data, $len_pack);
        socket_close($sock);
        sleep(2);
$zapros3 = mysql_query("SELECT * FROM GSM WHERE obtaine_ip='$module_ip'");
    $res3 = mysql_fetch_array($zapros3);


    mysql_query("DELETE FROM GSM WHERE obtaine_ip='$module_ip'");
$module_data="new+at=AT+CSQ";
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        $sock_data = socket_connect($sock, $module_ip, $client_port);
        $len_pack = strlen($module_data);
        $sock_data = socket_write($sock, $module_data, $len_pack);
        socket_close($sock);
        sleep(1);
$module_data="update_GSM";
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        $sock_data = socket_connect($sock, $module_ip, $client_port);
        $len_pack = strlen($module_data);
        $sock_data = socket_write($sock, $module_data, $len_pack);
        socket_close($sock);
        sleep(2);
$zapros4 = mysql_query("SELECT * FROM GSM WHERE obtaine_ip='$module_ip'");
    $res4 = mysql_fetch_array($zapros4);



    echo("<tr><td>Оператор<td colspan='2'>$res3[ussd]");
    echo("<tr><td>Уровень сигнала<td colspan='2'>$res4[ussd]");
                  echo("</tr></table><br>");
                  }







mysql_close($dbcnx);
echo(" </body></html> ");
?>
