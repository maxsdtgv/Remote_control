<?PHP
session_start();
if ($_SESSION['nnn']=='' && $_SESSION['ppp']=='') header("Location: /index.html");
#======== Socket config ===================================
$local_ip_bind="192.168.1.1";
$local_port_bind=50051;

$module_ip = $_POST['web_ipaddr'];
$module_port = $_POST['web_portno'];
$param = $_POST['param'];
$value = $_POST['value'];
$page_return = $_POST['page_return'];
$userdb = $_SESSION['nnn'];
$passdb = $_SESSION['ppp'];
$name_db=$_SESSION['name_db'];

if ($value == "" && $param =="pin") {$param="sms_pin"; $value="F";}
if ($value == "" && $param =="call_num1") {$param="call_num1"; $value="F";}
if ($value == "" && $param =="call_num2") {$param="call_num2"; $value="F";}
if ($value == "" && $param =="call_num3") {$param="call_num3"; $value="F";}
if ($param == "ussd") {} else {$value = mb_convert_encoding ($value ,"Windows-1251" ,"UTF-8");}
if ($value == "") {} else {
        $module_mess="new+" . $param . "=" . $value;
        $module_mess=str_replace("'", "", $module_mess);
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        $sock_data = socket_connect($sock, $module_ip, $module_port);
        $len_pack = strlen($module_mess);
        $sock_data = socket_write($sock, $module_mess, $len_pack);
        socket_close($sock);

if ($param=="at"){sleep(2);}
if ($param=="ussd"){sleep(10);}
if ($param=="sms"){sleep(20);}
if ($param=="signal"){sleep(20);}
//================================================

$dbcnx=mysql_connect("127.0.0.1",$userdb,$passdb) or die("<html><BODY BGCOLOR=#4A6B7C>
                                                    <Script Language='JavaScript'>
                                                    alert('Data Base error.')
                                                    </Script></BODY></html>");
mysql_select_db($name_db);
$zapros = mysql_query("SHOW TABLES");
while ($res = mysql_fetch_array($zapros)){
                                         $zapros2 = mysql_query("DELETE FROM $res[0] WHERE obtaine_ip='$module_ip'");
                                         }
mysql_close($dbcnx);


//==================================================
$module_data="update_all_tables";
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        $sock_data = socket_connect($sock, $module_ip, $module_port);
        $len_pack = strlen($module_data);
        $sock_data = socket_write($sock, $module_data, $len_pack);
        socket_close($sock);
sleep(2);
}
header("Location: /cgi-bin/$page_return");
?>
