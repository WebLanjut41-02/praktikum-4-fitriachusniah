<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menu extends MY_Controller {
	public function __construct()
	  {
	    parent::__construct();
	    $this->load->model('Model_Menu');
	    $this->load->model('Model_Vendor');
	    $this->load->helper(array('form', 'url'));
	  }
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{

    $this->load->database();
		$jumlah_data = $this->Model_Menu->jumlah_data();
		$this->load->library('pagination');
		$config['base_url'] = base_url().'menu/index/';
		$config['total_rows'] = $jumlah_data;
		$config['per_page'] = 5;
    $config['next_link'] = 'Next';
    $config['prev_link'] = 'Previous';
		$from = $this->uri->segment(3);
		$this->pagination->initialize($config);

    $keyword = $this->input->post('keyword');


      if (isset($keyword)) {
        $data['menu'] = $this->Model_Menu->cariMenu($keyword);
      }else {
        	$data['menu'] = $this->Model_Menu->data($config['per_page'],$from);
      }
    $this->load->view('admin/menu/list_menu',$data);

		// $data = $this->Model_Menu->getAllMenu();
		// $this->session->set_userdata('all_data',$data);


	}

	public function inputmenu()
	{
	$data2 = $this->Model_Vendor->getAllvendor();
	$this->session->set_userdata('all_data2',$data2);
    $data = $this->Model_Menu->getAllMenu();
    $this->session->set_userdata('all_data',$data);

		$this->load->view('admin/menu/inputmenu');
	}

	public function prosesinputmenu(){
		$id_paket 			 = $this->input->post('Id_Menu_Paket');
        $nama_paket 		 = $this->input->post('Nama_Paket');
       	$harga_paket	     = $this->input->post('Harga_Paket');
        $deskripsi_paket     = $this->input->post('Deskripsi_Paket');
		$kategori_paket 	 = $this->input->post('Kategori_Paket');
		$jenis_paket	 	 = $this->input->post('Jenis_Paket');
		$kategori_menu_paket = $this->input->post('Kategori_Menu_Paket');
		$id_vendor 			 = $this->input->post('Id_Vendor');

		$config['upload_path']          = './gambar/menu/';
		$config['allowed_types']        = 'jpeg|jpg|png';
		$config['max_size']             = 2000;

		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload('Gambar_Paket')){
			$gambar_paket = '';
			$this->Model_Menu->inputmenu($id_paket,$nama_paket,$gambar_paket,$harga_paket,$deskripsi_paket,$kategori_paket,$jenis_paket,$kategori_menu_paket,$id_vendor);
		}else{
			$data = array('upload_data' => $this->upload->data());
			$gambar_paket = $data['upload_data']['file_name'];
			$this->Model_Menu->inputmenu($id_paket,$nama_paket,$gambar_paket,$harga_paket,$deskripsi_paket,$kategori_paket,$jenis_paket,$kategori_menu_paket,$id_vendor);


		}

       $message = "Data Berhasil Ditambahkan";
				   	echo "<script type='text/javascript'>
				   			alert('$message');
				   			window.location.href = '" . base_url() . "menu/detailmenu2/$id_paket';
				   		  </script>";

	}

	public function editmenu()
	{
		$query['data'] = $this->Model_Menu->getMenu($_GET['Id_Menu_Paket']);
		$this->load->view('admin/menu/editmenu',$query);
	}


  public function deletemenu()
	{
	  $this->Model_Menu->deleteMenu($_GET['Id_Menu_Paket']);
    $message = "Data Berhasil Dihapus";
         echo "<script type='text/javascript'>
             alert('$message');
             window.location.href = '" . base_url() . "menu';
             </script>";
	}


	public function detailmenu()
	{
		$query['data'] = $this->Model_Menu->getMenu($_GET['Id_Menu_Paket']);

		$this->load->view('admin/menu/detailmenu',$query);
	}

	public function detailmenu2($id)
	{
		$query['data'] = $this->Model_Menu->getMenu($id);

		$this->load->view('admin/menu/detailmenu',$query);
	}

	public function proseseditmenu(){
   		$id_paket 			 = $this->input->post('Id_Menu_Paket');
        $nama_paket 		 = $this->input->post('Nama_Paket');
       	$harga_paket	     = $this->input->post('Harga_Paket');
        $deskripsi_paket     = $this->input->post('Deskripsi_Paket');
		$kategori_paket 	 = $this->input->post('Kategori_Paket');
		$jenis_paket	 	 = $this->input->post('Jenis_Paket');
		$kategori_menu_paket = $this->input->post('Kategori_Menu_Paket');
		$id_vendor 			 = $this->input->post('Id_Vendor');

		$config['upload_path']          = './gambar/menu/';
		$config['allowed_types']        = 'jpeg|jpg|png';
		$config['max_size']             = 2000;

		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload('Gambar_Paket')){

			$gambar_paket = $this->input->post('Foto_Profil_Lama');

			$this->Model_Menu->editmenu($id_paket,$nama_paket,$gambar_paket,$harga_paket,$deskripsi_paket,$kategori_paket,$jenis_paket,$kategori_menu_paket,$id_vendor);
		}else{
			$data = array('upload_data' => $this->upload->data());
			$gambar_paket = $data['upload_data']['file_name'];
			$this->Model_Menu->editmenu($id_paket,$nama_paket,$gambar_paket,$harga_paket,$deskripsi_paket,$kategori_paket,$jenis_paket,$kategori_menu_paket,$id_vendor);

		}
			$id = $id_paket;
            $message = "Data Berhasil Diubah";
				   	echo "<script type='text/javascript'>
				   			alert('$message');
				   			window.location.href = '" . base_url() . "menu/detailmenu2/$id_paket';
				   		  </script>";

	}


}
