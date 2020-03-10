<?php
/* Smarty version 3.1.30, created on 2020-03-10 03:03:33
  from "C:\xampp\htdocs\nw\proyectoReservasUNICAH\tpl\globalfooter.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5e66f5755ab9e7_89693556',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '890cda374c4be4b3b52373bde014f3405220b865' => 
    array (
      0 => 'C:\\xampp\\htdocs\\nw\\proyectoReservasUNICAH\\tpl\\globalfooter.tpl',
      1 => 1583797666,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5e66f5755ab9e7_89693556 (Smarty_Internal_Template $_smarty_tpl) {
?>


	</div><!-- close main-->

	<footer class="footer navbar">
		&copy; 2020 <a href="http://www.unicah.edu">Universidad Catolica de Honduras</a> <br/>
		<a href="https://www.google.com/search?q=gestion+de+proyectos&rlz=1C1CHBF_esHN874HN874&oq=gestion+de+pro&aqs=chrome.0.0j69i57j0l6.2765j0j7&sourceid=chrome&ie=UTF-8">Gestión De Proyectos Informáticos</a>
		
	</footer>

	<?php echo '<script'; ?>
 type="text/javascript">
		init();
		$.blockUI.defaults.css.border = 'none';
		$.blockUI.defaults.css.top = '25%';

	<?php echo '</script'; ?>
>

	<?php if (!empty($_smarty_tpl->tpl_vars['GoogleAnalyticsTrackingId']->value)) {?>
		
			<?php echo '<script'; ?>
>
			  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		  
			  ga('create', '<?php echo $_smarty_tpl->tpl_vars['GoogleAnalyticsTrackingId']->value;?>
', 'auto');
			  ga('send', 'pageview');
			<?php echo '</script'; ?>
>
	<?php }?>

	</body>
</html><?php }
}
