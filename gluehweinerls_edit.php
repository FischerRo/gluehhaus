<?php

    /*** include the header ***/
    include 'includes/header.php';

    /*** include the database connection ***/
    include 'includes/conn.php';

    /*** check for valid database connection ***/
    if($db)
    {

        /*** Get Gluehwein_ID from Request ***/
        $wein_id = $_GET["wein_id"];
        $zutat_id = $_GET["zutat_id"];

        /*** SQL query to get current Gluehwein ***/
        $sql_gluehwein = 
            "";

        /*** the SQL queries to get List of Wein and Zutaten ***/
        $sql = "";

        $sql2 = "";




        /*** run the queries ***/
        $result_gluehwein = mysql_query($sql_gluehwein) 
            or die(mysql_error());
        $result = mysql_query($sql) or die(mysql_error());
        $result2 = mysql_query($sql2) or die(mysql_error());

        /*** create the arrays ***/
        $wein_array = array();
        $zutat_array = array();

        /*** check for a valid resource ***/
        if(is_resource($result_gluehwein) & is_resource($result) & is_resource($result2))
        {
            /*** check there are results ***/
            if(mysql_num_rows($result_gluehwein) != 0)
            {
                /*** stuff the gluehwein into the gluehwein object ***/
                $gluehwein = mysql_fetch_assoc($result_gluehwein);
            }
            /*** check there are results ***/
            if(mysql_num_rows($result) != 0)
            {
                /*** stuff the entries into the array ***/
                while($row = mysql_fetch_array($result, MYSQL_ASSOC))
                {
                    $wein_array[] = $row;
                    /** Uncomment these lines to print raw sql results **/ 
                    // print_r($row);
                    // echo '<br/>';
                }
            }
            /*** check there are results ***/
            if(mysql_num_rows($result2) != 0)
            {
                /*** stuff the entries into the array ***/
                while($row = mysql_fetch_array($result2, MYSQL_ASSOC))
                {
                    $zutat_array[] = $row;
                    /** Uncomment these lines to print raw sql results **/ 
                    // print_r($row);
                    // echo '<br/>';
                }
            }
        }
        else
        {
            echo 'Oops, da ist was schief gelaufen.<br/>';
            echo mysql_errno($link).': '.mysql_error($link).'<br/>';
            echo 'Abfrage war: '.$sql;
        }
    }
    else
    {
        echo 'Database Unavailable';
    }
?>

<div class="section">
    <p>
    A Gl&uuml;hweinerl bearbeiten <br/> 
    </p>
    <form action="gluehweinerls_update.php" method="post">
        <input type="hidden" name="wein_alt" value="<?php echo $gluehwein['Wein_Id']; ?>">
        <input type="hidden" name="zutat_alt" value="<?php echo $gluehwein['Zutat_Id'];?>">
        <table width="60%" style="padding:1px 50px 0px 40px;">
            <tr>
                <th colspan="2">
                    <label>Neu's Gl&uuml;hweinerl</label>
                </tdh>
            </tr>
            <tr>
                <td>
                    <label for="name">Name:</label>
                </td>
                <td>
                    <input name="name" type="text" value="<?php echo $gluehwein['Name']?>" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="basispreis">Preis:</label>
                </td>
                <td>
                    <input name="basispreis" type="number" value="<?php echo $gluehwein['Basispreis']?>"
                        step="0.01" min="0.01" max="9.99"/>
                </td>
                </tr>
            <tr>
            <tr>
                <td>
                    <label for="wein">Wein:</label>
                </td>
                <td>
                    <select name="wein_id">
                        <?php

                            if(sizeof($wein_array) > 0)
                            {
                            foreach($wein_array as $wein)
                                {

                                    echo '<option value="'.$wein['Wein_Id'].'" ';
                                    if($wein['Wein_Id'] == $gluehwein['Wein_Id']){
                                        echo 'selected';
                                    }
                                    echo '>';
                                    echo $wein['Name'];
                                    echo '</option>';
                                }
                            }
                            else
                            {
                                echo 'Erst Wein anlegen';
                            } 

                        ?>
                    </select>
                </td>
                </tr>
            <tr>
            <tr>
                <td>
                    <label for="zutat">Zutat:</label>
                </td>
                <td>
                    <select name="zutat_id">
                        <?php

                            if(sizeof($zutat_array) > 0)
                            {
                            foreach($zutat_array as $zutat)
                                {
                                    echo '<option value="'.$zutat['Zutat_Id'].'"';
                                    if($zutat['Zutat_Id'] == $gluehwein['Zutat_Id']){
                                        echo 'selected';
                                    }     
                                    echo '>';                               
                                    echo $zutat['Name'];
                                    echo '</option>';
                                }
                            }
                            else
                            {
                                echo 'Erst Zutat anlegen';
                            } 

                        ?>
                    </select>
                </td>
            <tr>


                <td colspan="2" align="center">
                    <input type="submit" value="Aktualisieren" style="width:30%"/>
                </td>
            </tr>
        </table>
    </form>
</div> 

<?php
        /*** include the footer file ***/
        include 'includes/footer.php';
?>