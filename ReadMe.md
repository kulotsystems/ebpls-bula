egov-ebpls-bula { } native-php-js
---
<p>Electronic Business Permit and Licensing System for the <b>Municipality of Bula, Camarines Sur</b>.<br></p>

<br>
<h2>Tech Stack</h2>
<a href="https://pages.revox.io/dashboard/" target="_blank">REVOX Pages Template</a> on top of native <code>PHP</code> and <code>JavaScript</code>.

<br>
<h2>Dev Setup</h2>
<ol>
    <li>
        Download and install <a href="https://www.apachefriends.org/download.html" target="_blank">XAMPP Version 7.4</a>.
    </li>
    <li>
        Clone or download this repository to the <code>xampp/htdocs</code> folder.<br>
        The final path should be: <code>/xampp/htdocs/ebpls-bula</code>.<br>
    </li>
    <li>
        Move <code>inc/egov2</code> folder to <code>/xampp/htdocs/</code> folder.<br>
        Its final path should be: <code>/xampp/htdocs/egov2</code>.<br>
    </li>
    <li>
        Open <a href="http://localhost/phpmyadmin" target="_blank">http://localhost/phpmyadmin</a> in your browser.
    </li>
    <li>
        Create a database named <code>egov2</code> and import <code>php/db/lids/egov2.sql</code> to it.
    </li>
    <li>
        Create a database named <code>egov3</code> and import <code>php/db/lids/egov3.sql</code> to it.
    </li>
    <li>
        OPTIONAL: Adjust <code>php/db/open.php</code> and <code>php/db/lids/open.php</code> if you configured your MySQL user.
    </li>
</ol>

<br>
<h2>Test</h2>
<ol>
    <li>
        Open <a href="http://localhost/ebpls-bula" target="_blank">http://localhost/ebpls-bula</a> in your web browser.
        <br>
        <small>DEFAULT USERNAME</small>: <code>admin</code>
        <br>
        <small>DEFAULT PASSWORD</small>: <code>admin</code>
    </li>
</ol>




