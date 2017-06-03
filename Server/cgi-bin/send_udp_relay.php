<?PHP
session_start();
if ($_SESSION['nnn']=='' && $_SESSION['ppp']=='') header("Location: /index.html");
$broadcast_ip=$_SESSION["broadcast_ip"];
$network_ip=$_SESSION["network_ip"];
$network_mask=$_SESSION["network_mask"];
$server_port=$_SESSION["server_port"];
$client_port=$_SESSION["client_port"];
$userdb = $_SESSION["nnn"];
$passdb = $_SESSION["ppp"];
$name_db=$_SESSION["name_db"];



#======== Socket config ===================================
$local_ip_bind="192.168.1.1";
$local_port_bind=50051;

$module_ip = $_POST["web_ipaddr"];
$module_port = $_POST["web_portno"];
$module_mess = $_POST["web_mess"];
$relay_time=$_POST["time"];
if ($module_mess =="update_Relay"){}else{
if ($relay_time =="") {$module_data=$module_mess;}
                  else {if ($relay_time>0){$relay_time=$relay_time*60;} $module_data=$module_mess . "+time=" . $relay_time;}
// Отправляем пакет включения реле формата Relay+R3+ON+time=15
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        $sock_data = socket_connect($sock, $module_ip, $module_port);
        $len_pack = strlen($module_data);
        $sock_data = socket_write($sock, $module_data, $len_pack);
        socket_close($sock);
sleep(1); }
// Соединяемся с базой для очистки таблицы Relay с адресом module_ip


$dbcnx= mysql_connect("127.0.0.1",$userdb,$passdb) or die("<html><BODY BGCOLOR=#4A6B7C>
                                                    <Script Language='JavaScript'>
                                                    alert('Incorect login or password.')
                                                    document.location='/index.html'
                                                    </Script></BODY></html>");
mysql_select_db($name_db);
$zapros2 = mysql_query("DELETE FROM Relay WHERE obtaine_ip='$module_ip'");
        mysql_close($dbcnx);
// Отправляем пакет для обновления лаблицы relay на модуль с адресом module_ip

$module_data="update_Relay";
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        $sock_data = socket_connect($sock, $module_ip, $module_port);
        $len_pack = strlen($module_data);
        $sock_data = socket_write($sock, $module_data, $len_pack);
        socket_close($sock);
sleep(1);
header("Location: /cgi-bin/relay_onoff.php?obtaine_ip=$module_ip");
?>
