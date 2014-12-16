<?php

    /*** include the header ***/
    include 'includes/header.php';

    /*** include the database connection ***/
    include 'includes/conn.php';

    /*** check for valid database connection ***/
    if($db)
    {
        /*** the SQL query to return the required columns & rows ***/
        $sql = "SELECT Nachname as Kassierer FROM Kassierer";


        if(isset($_GET['filter'])){
            $filter = $_GET['filter'];
            $sql = "SELECT * FROM Kassierer";

        };



        /*** run the query ***/
        $result = mysql_query($sql) or die(mysql_error());

        /*** create the blog array ***/
        $umsatz_array = array();

        /*** check for a valid resource ***/
        if(is_resource($result))
        {
            /*** check there are results ***/
            if(mysql_num_rows($result) != 0)
            {
                /*** stuff the blog entries into the blog array ***/
                while($row = mysql_fetch_array($result, MYSQL_ASSOC))
                {
                    $umsatz_array[] = $row;
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
        echo 'Bisher noch kein Gluehwein verkauft';
    }
?>

<div class="section">
    <p>
    &Uuml;bersicht der Ums&auml;tze pro Kassierer <br/> 
    <form action="umsaetze.php">
         <table width="60%" style="padding:1px 50px 0px 40px;">
            <tr>
               <td>
                    <input type="submit" value="Filter"/>
                </td>
                <td>
                    <input name="filter" type="text" value="<?php echo $filter?>"/>
                </td>

            </tr>
        </table>
    </form>
    </p>



    <?php

        if(sizeof($umsatz_array) > 0)
        {

            echo '<table width="100%">';
            echo '<tr>';
                echo '<th>Kassierer</th>';
                echo '<th>#Bestellungen</th>';
                echo '<th>#Bestellpositionen</th>';
                echo '<th>#Umsatz</th>';
                echo '<th>#Provision</th>';
            echo '</tr>';
            
            /*** loop over the umsatz_row array and display umsatz_rows ***/
            foreach($umsatz_array as $umsatz_row)
            {

                echo '<tr>';
                echo '<td align="center">'.$umsatz_row['Kassierer'].'</a></td>';
                echo '<td align="center">'.$umsatz_row['#Bestellungen'].'</td>';
                echo '<td align="center">'.$umsatz_row['#BP'].'</td>';
                echo '<td align="center">'.$umsatz_row['Umsatz'].'</td>';
                echo '<td align="center">'.$umsatz_row['Gehalt'].'</td>';
                echo '</tr>';
            }
            echo '</table>';    
        }
        else
        {
            echo 'Nix verkauft! - trinkt denn niemand mehr Gl&uuml;hwein?';
        } 
    ?>
</div> 

<?php
        /*** include the footer file ***/
        include 'includes/footer.php';
?>