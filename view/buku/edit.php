<?php
require_once('../../model/buku.php');
$edit_buku = $buku->edit($_GET['id']);
?>
<form method="POST" action="controller/bukucontroller.php?page=updatebuku&id=<?= htmlspecialchars($_GET['id']) ?>" enctype="multipart/form-data">
    <div class="form-group">
        <label>Judul Buku</label>
        <input type="text" name="judul" class="form-control" value="<?= htmlspecialchars($edit_buku['judul']) ?>">
    </div>
    <div class="form-group">
        <label>Nomor ISBN</label>
        <input type="text" name="noisbn" class="form-control" value="<?= htmlspecialchars($edit_buku['noisbn']) ?>">
    </div>
    <div class="form-group">
        <label>Penulis</label>
        <input type="text" name="penulis" class="form-control" value="<?= htmlspecialchars($edit_buku['penulis']) ?>">
    </div>
    <div class="form-group">
        <label>Penerbit</label>
        <input type="text" name="penerbit" class="form-control" value="<?= htmlspecialchars($edit_buku['penerbit']) ?>">
    </div>
    <div class="form-group">
        <label>Tahun</label>
        <input type="number" name="tahun" class="form-control" value="<?= htmlspecialchars($edit_buku['tahun']) ?>">
    </div>
    <div class="form-group">
        <label>Stok</label>
        <input type="number" name="stok" class="form-control" value="<?= htmlspecialchars($edit_buku['stok']) ?>">
    </div>
    <div class="form-group">
        <label>Harga Pokok</label>
        <input type="number" id="harga_pokok" name="harga_pokok" class="form-control" value="<?= htmlspecialchars($edit_buku['harga_pokok']) ?>">
    </div>
    <div class="form-group">
        <label>Keuntungan</label>
        <input type="number" id="keuntungan" name="keuntungan" class="form-control" value="<?= htmlspecialchars($edit_buku['keuntungan']) ?>">
    </div>
    <div class="form-group">
        <label>PPN (dalam persen)</label>
        <input type="number" id="ppn" name="ppn" class="form-control" value="<?= htmlspecialchars($edit_buku['ppn']) ?>">
    </div>
    <div class="form-group">
        <label>Diskon</label>
        <input type="number" id="diskon" name="diskon" class="form-control" value="<?= htmlspecialchars($edit_buku['diskon']) ?>">
    </div>
    <div class="form-group">
        <label>Harga Jual</label>
        <input type="number" id="harga_jual" name="harga_jual" class="form-control" readonly value="<?= htmlspecialchars($edit_buku['harga_jual']) ?>">
    </div>
    <div class="form-group">
        <label>Foto</label>
        <input type="file" name="foto" class="form-control">
    </div>
    <div class="form-group">
        <!-- Tombol Kembali -->
        <button type="button" onclick="goToBukuPage()" class="btn btn-primary">Kembali</button>

        <!-- Tombol Simpan -->
        <input type="submit" value="Simpan" class="btn btn-success">
    </div>
</form>

<script type="text/javascript">
    $(document).ready(function(){
        function calculateHargaJual() {
            var diskon = parseFloat($("#diskon").val()) || 0;
            var harga_pokok = parseFloat($("#harga_pokok").val()) || 0;
            var ppn = parseFloat($("#ppn").val()) || 0;
            var keuntungan = parseFloat($("#keuntungan").val()) || 0;

            var harga_jual = harga_pokok - (diskon / 100 * harga_pokok) + (ppn / 100 * harga_pokok) + keuntungan;
            $("#harga_jual").val(harga_jual);
        }

        $("#diskon, #harga_pokok, #ppn, #keuntungan").keyup(function(){
            calculateHargaJual();
        });

        // Initial calculation on page load
        calculateHargaJual();
    });

    function goToBukuPage() {
        window.location.href = 'http://localhost/tokobuku/index.php?page=buku';
    }
</script>
