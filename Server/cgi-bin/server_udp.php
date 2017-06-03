<?PHP
#===========Server UDPD configuration ================
            $local_address="0.0.0.0";
            $local_port=50051;
            $remote_port=50050;
#===========Data Base configuration =================
            $db_name="Module";
            $db_address="127.0.0.1";
            $db_login="root";
            $db_pass="maxvell2000";
#====================================================
$key_ok=0;
$table_ok=0;
            $socket=socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
            socket_set_option($socket, SOL_SOCKET, SO_KEEPALIVE, 1);
            socket_bind($socket,$local_address,$local_port);

           $dbcnx = mysql_connect($db_address,$db_login,$db_pass);
           $select_db = mysql_select_db($db_name);

while(true){

            socket_recvfrom($socket,$buf,1000,0,$clientip,$clientport);
if ($clientport == $remote_port){
            $arra = explode("&", $buf);
            foreach ($arra as $value) {
                                      $dem = explode("=", $value);
                                      if (($dem[0]=="key_id") && ($dem[1]=="dinka")) {$key_ok=1;}
                                      if (($dem[0]=="table") && ($key_ok==1)) {$db_table=$dem[1];
                                                                               $zapros = mysql_query("INSERT INTO $db_table SET obtaine_ip='$clientip'");
                                                                               $table_ok=1;
                                                                              }
                                      if (($key_ok==1)&&($table_ok==1)) {



                                                                        $dem[1]=str_replace("'", "", $dem[1]);
                                                                        $zapros = mysql_query("UPDATE $db_table SET $dem[0]='$dem[1]' WHERE obtaine_ip='$clientip'");
                                                                        }
                                      };
                                      unset($value);
                                      $key_ok=0;
                                      $table_ok=0;

#            file_put_contents("./cs.log","$buf\n",FILE_APPEND);

                               }
           }
?>
