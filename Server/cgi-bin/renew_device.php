<?PHP
session_start();
if ($_SESSION['nnn']=='' && $_SESSION['ppp']=='') header("Location: /index.html");
#======== Socket config ===================================
$local_ip_bind="192.168.1.1";
$local_port_bind=50051;

$module_ip = $_POST['web_ipaddr'];
$module_port = $_POST['web_portno'];
$module_mess = $_POST['web_mess'];
$userdb = $_SESSION['nnn'];
$passdb = $_SESSION['ppp'];
$name_db=$_SESSION['name_db'];
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
        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
//        $sock_data = socket_set_option($sock, SOL_SOCKET, SO_BROADCAST, 1);
        $sock_data = socket_connect($sock, $module_ip, $module_port);
        $len_pack = strlen($module_mess);
        $sock_data = socket_write($sock, $module_mess, $len_pack);
        socket_close($sock);

sleep(3);
header("Location: /cgi-bin/start.php");
?>
