<?PHP
session_start();
if ($_SESSION['nnn']=='' && $_SESSION['ppp']=='') header("Location: /index.html");
#======== Socket config ===================================
$local_ip_bind="192.168.2.1";
$local_port_bind=50051;

$module_ip = $_POST['web_ipaddr'];
$module_port = $_POST['web_portno'];
$module_mess = $_POST['web_mess'];
$page_return = $_POST['page_return'];

        $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP); 
        $sock_data = socket_set_option($sock, SOL_SOCKET, SO_BROADCAST, 1);
   
        $sock_data = socket_connect($sock, $module_ip, $module_port);
        $len_pack = strlen($module_mess);
        $sock_data = socket_write($sock, $module_mess, $len_pack); 
        socket_close($sock);

header("Location: /cgi-bin/$page_return");
?>
