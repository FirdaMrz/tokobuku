<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TOKOBUKU</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="path/to/your/style.css">

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
<?php
session_start();
?>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>TOKO</span>BUKU</a>
				<ul class="user-menu">
					<li class="dropdown pull-right"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/profile.jpeg" alt="Profile" style="width: 30px; height: 30px; border-radius: 50%; margin-right: 5px;">User <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
						<li><a href="view/profile/profile.php"><img src="assets/img/profile.jpeg" alt="Profile" style="width: 20px; height: 20px; border-radius: 50%; margin-right: 10px;"> Profile </a></li>
						<li><a href="controller/authcontroller.php?page=logout"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
						</ul>

					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">

		<?php
		
		if (!isset($_GET['page'])) {
			echo '<li class="active"><a href="index.php"><i class="bi bi-speedometer2 icon-margin"></i> Dashboard</a></li>';
		} else {
			echo '<li><a href="index.php"><i class="bi bi-speedometer2"></i> Dashboard</a></li>';
		}
		
		if (isset($_GET['page']) && $_GET['page'] == 'order') {
			echo '<li class="active"><a href="index.php?page=order"><i class="bi bi-cart"></i> Order</a></li>';
		} else {
			echo '<li><a href="index.php?page=order"><i class="bi bi-cart"></i> Order</a></li>';
		}
		
		if (isset($_GET['page']) && $_GET['page'] == 'buku') {
			echo '<li class="active"><a href="index.php?page=buku"><i class="bi bi-book"></i> Buku</a></li>';
		} else {
			echo '<li><a href="index.php?page=buku"><i class="bi bi-book"></i> Buku</a></li>';
		}
		
		if ($_SESSION['level'] == 'operator' OR $_SESSION['level'] == 'admin') {
			if (isset($_GET['page']) && $_GET['page'] == 'distributor') {
				echo '<li class="active"><a href="index.php?page=distributor"><i class="bi bi-building"></i> Distributor</a></li>';
			} else {
				echo '<li><a href="index.php?page=distributor"><i class="bi bi-building"></i> Distributor</a></li>';
			}
		
			if (isset($_GET['page']) && $_GET['page'] == 'pemasok') {
				echo '<li class="active"><a href="index.php?page=pemasok"><i class="bi bi-pencil-square"></i> Pemasok</a></li>';
			} else {
				echo '<li><a href="index.php?page=pemasok"><i class="bi bi-pencil-square"></i> Pemasok</a></li>';
			}
		
			if (isset($_GET['page']) && $_GET['page'] == 'penjualan') {
				echo '<li class="active"><a href="index.php?page=penjualan"><i class="bi bi-bar-chart"></i> Penjualan</a></li>';
			} else {
				echo '<li><a href="index.php?page=penjualan"><i class="bi bi-bar-chart"></i> Penjualan</a></li>';
			}
		}
		
		if ($_SESSION['level'] == 'admin') {
			if (isset($_GET['page']) && $_GET['page'] == 'kasir') {
				echo '<li class="active"><a href="index.php?page=kasir"><i class="bi bi-person"></i> Kasir</a></li>';
			} else {
				echo '<li><a href="index.php?page=kasir"><i class="bi bi-person"></i> Kasir</a></li>';
			}
		}
	
		
		?>
			
		<div class="attribution">PPLG<br/></div>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Icons</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">TOKO BUKU</h1>
			</div>
		</div><!--/.row-->

	<?php

if(isset($_SESSION['username'])){

	if(isset($_GET['page'])){
			if($_GET['page'] == 'buku'){
				require_once('view/buku/index.php');
			}
			if($_GET['page'] == 'tambahbuku'){
				require_once('view/buku/create.php');
			}
			if($_GET['page'] == 'editbuku'){
					require_once('view/buku/edit.php');
			}
			if($_GET['page'] == 'detailbuku'){
				require_once('view/buku/show.php');
			}

		if($_SESSION['level'] == 'operator' OR $_SESSION['level'] == 'admin'){

			if($_GET['page'] == 'distributor'){
				require_once('view/distributor/index.php');
			}
			if($_GET['page'] == 'tambahdistributor'){
				require_once('view/distributor/create.php');
			}
			if($_GET['page'] == 'editdistributor'){
				require_once('view/distributor/edit.php');
			}

			if($_GET['page'] == 'penjualan'){
				require_once('view/penjualan/index.php');
			}

			if($_GET['page'] == 'detail_penjualan'){
				require_once('view/penjualan/show.php');
			}



			if($_GET['page'] == 'pemasok'){
				require_once('view/pasok/index.php');
			}
			if($_GET['page'] == 'tambahpasok'){
				require_once('view/pasok/create.php');
			}
			if($_GET['page'] == 'editpasok'){
				require_once('view/pasok/edit.php');
			}

		}
		if ($_SESSION['level'] == 'admin') {
			if($_GET['page'] == 'kasir'){
				require_once('view/kasir/index.php');
			}
			if($_GET['page'] == 'tambahkasir'){
				require_once('view/kasir/create.php');
			}
			if($_GET['page'] == 'editkasir'){
				require_once('view/kasir/edit.php');
			}
			if($_GET['page'] == 'detailkasir'){
				require_once('view/kasir/show.php');
			}
		}




			if($_GET['page'] == 'order'){
				require_once('view/order/index.php');
			}

			if($_GET['page'] == 'cart'){
				require_once('view/order/cart.php');
			}

			if($_GET['page'] == 'selesai'){
				require_once('view/order/selesai.php');
			}

			if($_GET['page'] == 'login'){
				require_once('view/login/index.php');
			}

	}else{
		require_once('view/home/index.php');
	}
}else {
	header('location: login.php');
}
?>




								
		
	</div>	<!--/.main-->


	<script>
		$('#calendar').datepicker({
		});

		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>

</html>
