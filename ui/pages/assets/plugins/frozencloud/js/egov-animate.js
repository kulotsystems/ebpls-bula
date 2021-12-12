/**
 * eGov-animate
 * Animate the eGov logo during page load.
 * @param  {node} e [the html element where to append the animation]
 *
 * Copyright 2020 | frozencloud (theshareideas.com) JONGA!
 *
 */

function egovAnimate(e) {
    if(window.innerWidth <= 767) {
        body.attr('data-animation-mode', 'static');
	}
	var svgMode = body.attr('data-animation-mode');
	var svg = "";
	svg += "<div class='" + svgMode + "' id='animation-container'>";
		svg += "<div class='" + svgMode + "' id='sprites-container'>";
			svg += "<div id='egov-logo' >";
				svg += "<svg class='" + svgMode + "' id='egov-svg' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 960 960'>";
					svg += "<path    id='gear'               d='M249,508v-5l2-18,3-23,12-38,14-36,33-40s37-31,38-32,42-22,42-22l35-12,34-3h56l30,8,20,7,24,12,44,32,29,32,20,34,12,29,10,41,1,34H937V441l-2-4-6-9-13-7-54-6-30-4-3-8-4-16-9-22-14-28-6-10-1-4,53-65,2-11V232l-6-7-48-50-40-38s-9-3-11-3h-9l-6,3-30,22-37,30-6-1-17-10-25-11-41-14-7-71s-5-18-5-19-3-6-3-6l-13-8H413l-10,6-6,8-2,6-5,48-6,37-10,2-19,7-19,8-22,9-16,9h-2l-3-2-12-9-19-15-20-17-16-12H210l-7,2-9,8-23,24-43,43-18,19-2,5-1,7v5l2,7,5,7,11,14,26,34,10,13v2l-1,3-2,4-5,9-8,17-8,19-9,30-1,4-4,2-12,2-41,4-19,2-11,2-7,4-7,8-4,6v68H249V498H22v68l4,6,7,8,7,4,11,2,19,2,41,4,12,2,4,2,1,4,9,30,8,19,8,17,5,9,2,4,1,3v2l-10,13-26,34-11,14-5,7-2,7v5l1,7,2,5,18,19,43,43,23,24,9,8,7,2h16l16-12,20-17,19-15,12-9,3-2h2l16,9,22,9,19,8,19,7,10,2,6,37,5,48,2,6,6,8,10,6H546l13-8s3-5,3-6,5-19,5-19l7-71,41-14,25-11,17-10,6-1,37,30,30,22,6,3h9c2,0,11-3,11-3l40-38,48-50,6-7V759l-2-11-53-65,1-4,6-10,14-28,9-22,4-16,3-8,30-4,54-6,13-7,6-9,2-4V498H708l-1,34-10,41-12,29-20,34-29,32-44,32-24,12-20,7-30,8H462l-34-3-35-12s-41-21-42-22-38-32-38-32l-33-40-14-36-12-38-3-23-2-18v-5' fill='#63ba45'/>";
					svg += "<circle  id='gear-circle-cover'  cx='480' cy='503' r='240' fill='#ffffff'/>";
					svg += "<rect    id='gear-half-cover'    y='1' width='960' height='497' fill='#ffffff'/>";

					svg += "<circle  id='citizen-head'       cx='481' cy='274' r='75' fill='#f3b41b'/>";
					svg += "<path    id='citizen-body'       d='M545,352H662l5,1,8,6V498l-4,5-7,3-46,1-2,1-1,3-3,6-12,32-19,49-21,57-14,35H497l-84-1-14-38-21-56-21-55-13-34H298s-5,0-12-5l-3-142,3-2,5-4,7-1H414l63,35Z' fill='#f3b41b'/>";
					svg += "<polygon id='roof'               points='27.5 181.5 928.5 181.5 928.5 157.5 478.5 0.5 27.5 156.5 27.5 181.5' fill='#63ba45'/>";

					svg += "<rect    id='wifi-1-left-blue'   x='26'  y='373' width='51' height='98'  fill='#3d52a3'/>";
					svg += "<rect    id='wifi-1-right-blue'  x='878' y='373' width='51' height='98'  fill='#3d52a3'/>";
					svg += "<rect    id='wifi-2-left-blue'   x='93'  y='299' width='66' height='172' fill='#3d52a3'/>";
					svg += "<rect    id='wifi-2-right-blue'  x='799' y='299' width='66' height='172' fill='#3d52a3'/>";
					svg += "<rect    id='wifi-3-left-blue'   x='176' y='204' width='73' height='269' fill='#3d52a3'/>";
					svg += "<rect    id='wifi-3-right-blue'  x='708' y='204' width='73' height='269' fill='#3d52a3'/>";

					svg += "<rect    id='wifi-1-left-white'  x='21'  y='369' width='60' height='106' fill='#ffffff'/>";
					svg += "<rect    id='wifi-1-right-white' x='872' y='369' width='60' height='106' fill='#ffffff'/>";
					svg += "<rect    id='wifi-2-left-white'  x='88'  y='295' width='75' height='180' fill='#ffffff'/>";
					svg += "<rect    id='wifi-2-right-white' x='794' y='295' width='75' height='180' fill='#ffffff'/>";
					svg += "<rect    id='wifi-3-left-white'  x='171' y='200' width='82' height='277' fill='#ffffff'/>";
					svg += "<rect    id='wifi-3-right-white' x='703' y='200' width='82' height='277' fill='#ffffff'/>";
				svg += "</svg>";
			svg += "</div>";

			svg += "<div id='egov-label'>";
				svg += "<div id='title' style='color: #242d30'>";
					svg += "<ul style='list-style: none; margin: 0; padding: 0'>";
						svg += "<li style='line-height: 1' class='text-bold'><big>e-Governance Team</big></li>";
						svg += "<li style='line-height: 1'>CAMARINES SUR POLYTECHNIC COLLEGES</li>";
					svg += "</ul>";
				svg += "</div>";
			svg += "</div>";

		svg += "</div>";
	svg += "</div>";

	if(e == null)
		body.append(svg);
	else
		e.html(svg);
}