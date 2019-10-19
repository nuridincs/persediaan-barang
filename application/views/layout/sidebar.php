<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <?php foreach($avatar as $a){ ?>
        <img src="<?php echo base_url('assets/upload/user/img/'.$a->nama_file)?>" class="img-circle" alt="User Image">
        <?php } ?>
      </div>
      <div class="pull-left info">
        <p><?=$this->session->userdata('name')?></p>
        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
      </div>
    </div>
    <!-- search form -->

    <ul class="sidebar-menu" data-widget="tree">
      <li class="header">MAIN NAVIGATION</li>

      <li>
        <a href="<?php echo base_url('admin')?>">
       <i class="fa fa-dashboard" aria-hidden="true"></i> <span>Dashboard</span></a>
      </li>
      <li class="treeview">
        <a href="#">
          <i class="fa fa-table"></i> <span>Data Barang</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          <li><a href="<?= base_url('admin/tabel_barangmasuk') ?>"><i class="fa fa-circle-o"></i> Tabel Barang Masuk</a></li>
          <li><a href="<?= base_url('admin/tabel_barangkeluar')?>"><i class="fa fa-circle-o"></i> Tabel Barang Keluar</a></li>
          <!-- <li><a href="<?php //echo base_url('admin/tabel_satuan')?>"><i class="fa fa-circle-o"></i> Tabel Satuan</a></li> -->
        </ul>
      </li>
      <li>
        <a href="<?php echo base_url('admin/kelolaPO')?>">
       <i class="fa fa-cogs" aria-hidden="true"></i> <span>Kelola PO</span></a>
      </li>
      <li>
        <a href="<?php echo base_url('admin/users')?>">
       <i class="fa fa-fw fa-users" aria-hidden="true"></i> <span>Data Users</span></a>
      </li>
      <li>
        <a href="<?php echo base_url('admin/laporan')?>">
       <i class="fa fa-cogs" aria-hidden="true"></i> <span>Laporan</span></a>
      </li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>