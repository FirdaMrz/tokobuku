<?php
require_once('model/buku.php');

$id_buku = $_GET['id'];
$list_buku = $buku->show($id_buku);
?>
<table class="table table-bordered table-striped">
    <tr>
        <td><strong>Judul Buku</strong></td>
        <td><?= htmlspecialchars($list_buku['judul']) ?></td>
        <td rowspan="10" style="width: 50%;">
            <div align="center">
                <img style="width: 450px; height: 500px;" src="foto/<?= htmlspecialchars($list_buku['foto']) ?>" alt="Gambar Buku">
            </div>
        </td>
    </tr>
    <tr>
        <td><strong>Nomor ISBN</strong></td>
        <td><?= htmlspecialchars($list_buku['noisbn']) ?></td>
    </tr>
    <tr>
        <td><strong>Penulis</strong></td>
        <td><?= htmlspecialchars($list_buku['penulis']) ?></td>
    </tr>
    <tr>
        <td><strong>Penerbit</strong></td>
        <td><?= htmlspecialchars($list_buku['penerbit']) ?></td>
    </tr>
    <tr>
        <td><strong>Tahun</strong></td>
        <td><?= htmlspecialchars($list_buku['tahun']) ?></td>
    </tr>
    <tr>
        <td><strong>Stok</strong></td>
        <td><?= htmlspecialchars($list_buku['stok']) ?></td>
    </tr>
    <tr>
        <td><strong>Harga Pokok</strong></td>
        <td>Rp.<?= htmlspecialchars($list_buku['harga_pokok']) ?>,-</td>
    </tr>
    <tr>
        <td><strong>Harga Jual</strong></td>
        <td>Rp.<?= htmlspecialchars($list_buku['harga_jual']) ?>,-</td>
    </tr>
    <tr>
        <td><strong>PPN</strong></td>
        <td><?= htmlspecialchars($list_buku['ppn']) ?>%</td>
    </tr>
    <tr>
        <td><strong>Diskon</strong></td>
        <td><?= htmlspecialchars($list_buku['diskon']) ?>%</td>
    </tr>
</table>

<!-- Tombol Kembali ke Menu Sebelumnya -->
<button onclick="goBack()" class="btn btn-primary">Kembali</button>

<script>
function goBack() {
    window.history.back();
}
</script>
