<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class menu aplikasi e-learning dokumenary.net
 *
 * @author Almazari <almazary@gmail.com>
 * @since  1.8
 */
class Menu
{
    private $menus = array();

    function __construct()
    {
        $this->default_menu();
    }

    private function default_menu()
    {
        $this->menus['admin'] = array(
            0 => array(
                '<a href="' . site_url() . '"><i class="menu-icon icon-home"></i>Beranda</a>',
               
            ),
            1 => array(
                '<a href="' . site_url('siswa'). '"><i class="menu-icon icon-group"></i>Siswa <span class="menu-count-pending-siswa"></span></a>',
                '<a href="' . site_url('pengajar'). '"><i class="menu-icon icon-user"></i>Pengajar <span class="menu-count-pending-pengajar"></span></a>'
            ),
          
        );

        $this->menus['pengajar'] = array(
            0 => array(
                '<a href="' . site_url() . '"><i class="menu-icon icon-home"></i>Beranda</a>',
                '<a href="' . site_url('pengumuman') . '"><i class="menu-icon icon-bullhorn"></i>Pengumuman</a>',
                '<a href="' . site_url('message') . '"><i class="menu-icon icon-comments"></i>Pesan <span class="menu-count-new-msg"></span></a>',
                '<a href="' . site_url('pengajar/jadwal') . '"><i class="menu-icon icon-tasks"></i>Jadwal Mengajar </a>'
            ),
            1 => array(
                '<a href="' . site_url('tugas?clear_filter=true') . '"><i class="menu-icon icon-tasks"></i>Tugas </a>',
               
                
            ),
            2 => array(
                '<a href="' . site_url('pengajar/filter') . '"><i class="menu-icon icon-search"></i>Filter Pengajar </a>',
                '<a href="' . site_url('siswa/filter') . '"><i class="menu-icon icon-search"></i>Filter Siswa </a>'
            ),
            3 => array(
                '<a href="' . site_url('login/logout') . '"><i class="menu-icon icon-signout"></i>Logout </a>'
            )
        );

        $this->menus['siswa'] = array(
            0 => array(
                '<a href="' . site_url() . '"><i class="menu-icon icon-home"></i>Beranda</a>',
                '<a href="' . site_url('message') . '"><i class="menu-icon icon-comments"></i>Pesan <span class="menu-count-new-msg"></span></a>',
                '<a href="' . site_url('siswa/jadwal_mapel') . '"><i class="menu-icon icon-tasks"></i>Jadwal Matapelajaran</a>'
            ),
            1 => array(
                '<a href="' . site_url('tugas?clear_filter=true') . '"><i class="menu-icon icon-tasks"></i>Tugas </a>',
                
               
            ),
            2 => array(
                '<a href="' . site_url('pengajar/filter') . '"><i class="menu-icon icon-search"></i>Filter Pengajar </a>',
                '<a href="' . site_url('siswa/filter') . '"><i class="menu-icon icon-search"></i>Filter Siswa </a>'
            ),
            3 => array(
                '<a href="' . site_url('login/logout') . '"><i class="menu-icon icon-signout"></i>Logout </a>'
            )
        );
    }

    public function add($rule, $index, $link)
    {
        $this->menus[$rule][$index][] = $link;
    }

    public function get()
    {
        if (is_admin()) {
            return $this->menus['admin'];
        } elseif (is_pengajar()) {
            return $this->menus['pengajar'];
        } elseif (is_siswa()) {
            return $this->menus['siswa'];
        }
    }
}
