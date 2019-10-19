  <?php $this->load->view('layout/head'); ?>
  <?php $this->load->view('layout/header'); ?>
  <!-- Left side column. contains the logo and sidebar -->
  <?php $this->load->view('layout/sidebar'); ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
    <?php if ($this->session->userdata('role') == 2) { ?>
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col col-xs-6" align="center">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
            <h3><?= $limit[0]->stok_limit ?></h3>
              <p>Stok Barang Hampir Habis</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="<?=base_url('admin/limitStok')?>" class="small-box-footer">Lihat Detail <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>

    </section>
  <?php } else { ?>
    <h1>Selamat Datang <?php echo $this->session->userdata('nama') ?> di Aplikasi Persediaan Barang</h1>
  <?php } ?>
  </div>
  <!-- /.content-wrapper -->
  <?php $this->load->view('layout/footer'); ?>
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<?php $this->load->view('layout/footerAssets'); ?>

