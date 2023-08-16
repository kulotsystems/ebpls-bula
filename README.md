### ebpls-bula
Electronic Business Permit and Licensing System (Bula, Camarines Sur).

#### Requirements
- `7.4 || ^8.0`
- `MariaDB ^10.4`

#### Dev Setup using XAMPP
1. Clone or download this repository to the `xampp/htdocs` folder.

   <small>The final path should be: `path_to/xampp/htdocs/ebpls-bula`.</small>

2. Copy [inc/egov2](inc/egov2) folder to `/xampp/htdocs` folder.

   <small>Its final path should be: `path_to/xampp/htdocs/egov2`.</small>

3. Open [phpMyAdmin](http://localhost/phpmyadmin) in your browser.

4. Create a database named `egov2` and import [php/db/lids/egov2.sql](php/db/lids/egov2.sql) to it.

5. Create a database named `egov3` and import [php/db/lids/egov3.sql](php/db/lids/egov3.sql) to it.

   OPTIONAL:
   Adjust [php/db/open.php](php/db/open.php)
   and [php/db/lids/open.php](php/db/lids/open.php) to your database server config.

#### Test
Open <http://localhost/ebpls-bula> in your web browser.
```
DEFAULT USERNAME: admin
DEFAULT PASSWORD: admin
```