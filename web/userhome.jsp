<!DOCTYPE html>
<html>
<head>
	<title>Welcome</title>
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<style type="text/css">
		body{
			margin: 0;
			font-family: 'Raleway', sans-serif;
		}
		.div{
			height: 100%;
			position: fixed;
			width: 210px;
			top: 0;
			background-color: #f1f1f1;
			display: table;
			vertical-align: middle;
		}
		.ul{
			list-style-type: none;
			padding: 0;
			display: table-cell;
			vertical-align: middle;
		}
		.ul li a{
			text-decoration: none;
			padding: 10px 10px;
			display: block;
			color: #000;
			font-size: 20px;
			word-break: break-all;
		}

		.ul li a:hover{
			background: #555;
			color: white;
		}
		p{
			padding: 10px;
			margin-left: 210px;
		}
		.row{
			display: table-row;
		}
	</style>
</head>
<body>
	<div class="div">
		<div class="row">
			<ul class="ul">
				<li><a href="personalInformation.jsp">Personal Info</a></li>
				<li><a href="qualification.jsp">Qualification</a></li>
				<li><a href="experience.jsp">Experience</a></li>
				<li><a href="work_semi.jsp">Workshop/Seminar Details</a></li>
				<li><a href="monographs.jsp">Monographs</a></li>
				<li><a href="proposaldetails.jsp">Proposal Details</a></li>
				<li><a href="membershipdetails.jsp">Membership Details</a></li>
			</ul>
		</div>
	</div>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
	consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
	cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
	proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</body>
</html>