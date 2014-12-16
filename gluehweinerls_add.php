<?php

    /*** include the header ***/
    include 'includes/header.php';

    /*** include the database connection ***/
    include 'includes/conn.php';

    /*** check for valid database connection ***/
    if($db)
    {
        /*** the SQL queries for Wein and Zutat ***/
        $sql = "SELECT
                    Wein_Id,
                    Name
                FROM Wein";

        $sql2 = "SELECT
                    Zutat_Id,
                    Name
                FROM Zutat";


        /*** run the query ***/
        $result = mysql_query($sql) or die(mysql_error());
        $result2 = mysql_query($sql2) or die(mysql_error());

        /*** create the arrays ***/
        $wein_array = array();
        $zutat_array = array();

        /*** check for a valid resource ***/
        if(is_resource($result) & is_resource($result2))
        {
            /*** check there are results ***/
            if(mysql_num_rows($result) != 0)
            {
                /*** stuff the blog entries into the blog array ***/
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
                /*** stuff the blog entries into the blog array ***/
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
            echo 'Database Unavailable';
        }
    }
    else
    {
        echo 'Bisher noch kein Gluehwein angelegt';
    }
?>

<div class="section">
    <p>
    A neu's Gl&uuml;hweinerl erfinden <br/> 
    </p>
    <form action="gluehweinerls_create.php" method="post">
        <table width="60%" style="padding:1px 50px 0px 40px;">
            <tr>
                <th colspan="2">
                    <label>Neu's Gl&uuml;hweinerl</label>
                </th>
            </tr>
            <tr>
                <td>
                    <label for="name">Name:</label>
                </td>
                <td>
                    <input name="name" type="text" value="Name" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="basispreis">Preis:</label>
                </td>
                <td>
                    <input name="basispreis" type="number" value="2.50" step="0.01" min="0.01" max="9.99"/>
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
                                    echo '<option value="'.$wein['Wein_Id'].'">';
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
                                    echo '<option value="'.$zutat['Zutat_Id'].'">';
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
                    <input type="submit" value="Anlegen" style="width:30%"/>
                </td>
            </tr>
        </table>
    </form>
</div> 

<?php
        /*** include the footer file ***/
        include 'includes/footer.php';
?>