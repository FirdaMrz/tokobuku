<?php
require_once('model/order.php');

$pencarian = '';
if(isset($_POST['pencarian'])){
	$pencarian = $_POST['pencarian'];
}

$list_produk = $order->produk($pencarian);
$id_kasir = $_SESSION['id_kasir'];
$jumlahorder = $order->jumlahorder($id_kasir);
$list_keranjang = $order->cart($id_kasir);
$jumlah_keranjang =0;


while ($keranjang = $list_keranjang->fetch(PDO::FETCH_LAZY)) {
	$jumlah_keranjang += $keranjang['jumlah'];
}
?>
<div class="col-md-8">
    <form method="POST" action="index.php?page=order">
        <div class="input-group">
            <input type="text" id="pencarian" name="pencarian" class="form-control" placeholder="Masukkan Judul atau Nomor ISBN">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit">Cari</button>
            </span>
        </div>
    </form>
</div>

<div class="pull-right">
    <a href="index.php?page=cart" class="btn btn-success">Lihat Keranjang</a>
</div>
<br>
<br>
<div class="pull-left">
    <strong>Barang Di Keranjang : <?=$jumlah_keranjang?></strong>
</div>

<p>
	
</p>
<br>
<table class="table table-bordered">
	<tr>
		<th>ISBN</th>
		<th>Judul</th>
		<th>Stok</th>
		<th>Harga Jual</th>
		<th>Diskon</th>
		<th>Action</th>
	</tr>
	<?php
	while ($produk = $list_produk->fetch(PDO::FETCH_LAZY)) {
	?>
	<tr>
		<td><?=$produk['noisbn']?></td>
		<td><?=$produk['judul']?></td>
		<td><?=$produk['stok']?></td>
		<td><?=$produk['harga_jual']?></td>
		<td><?=$produk['diskon']?> %</td>
		<td>
			<a href="controller/ordercontroller.php?page=add&id_buku=<?=$produk['id_buku']?>" class="btn btn-success">Add To Chart</a>
		</td>
	</tr>
	<?php
	}
	?>
</table>
<script>
	$("#pencarian").focus();
</script>