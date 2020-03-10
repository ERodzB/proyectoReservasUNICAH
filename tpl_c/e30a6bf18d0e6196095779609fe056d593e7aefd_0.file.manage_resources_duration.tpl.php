<?php
/* Smarty version 3.1.30, created on 2020-03-10 03:12:12
  from "C:\xampp\htdocs\nw\proyectoReservasUNICAH\tpl\Admin\Resources\manage_resources_duration.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5e66f77c314f12_51498283',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e30a6bf18d0e6196095779609fe056d593e7aefd' => 
    array (
      0 => 'C:\\xampp\\htdocs\\nw\\proyectoReservasUNICAH\\tpl\\Admin\\Resources\\manage_resources_duration.tpl',
      1 => 1583784874,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5e66f77c314f12_51498283 (Smarty_Internal_Template $_smarty_tpl) {
?>

<div class="minDuration"
	 data-value="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetMinLength();?>
"
	 data-days="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetMinLength()->Days();?>
"
	 data-hours="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetMinLength()->Hours();?>
"
	 data-minutes="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetMinLength()->Minutes();?>
">
	<?php if ($_smarty_tpl->tpl_vars['resource']->value->HasMinLength()) {?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceMinLength','args'=>$_smarty_tpl->tpl_vars['resource']->value->GetMinLength()),$_smarty_tpl);?>

	<?php } else { ?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceMinLengthNone'),$_smarty_tpl);?>

	<?php }?>
</div>

<div class="maxDuration"
	 data-value="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetMaxLength();?>
"
	 data-days="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetMaxLength()->Days();?>
"
	 data-hours="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetMaxLength()->Hours();?>
"
	 data-minutes="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetMaxLength()->Minutes();?>
">
	<?php if ($_smarty_tpl->tpl_vars['resource']->value->HasMaxLength()) {?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceMaxLength','args'=>$_smarty_tpl->tpl_vars['resource']->value->GetMaxLength()),$_smarty_tpl);?>

	<?php } else { ?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceMaxLengthNone'),$_smarty_tpl);?>

	<?php }?>
</div>

<div class="bufferTime"
	 data-value="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetBufferTime();?>
"
	 data-days="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetBufferTime()->Days();?>
"
	 data-hours="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetBufferTime()->Hours();?>
"
	 data-minutes="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetBufferTime()->Minutes();?>
">
	<?php if ($_smarty_tpl->tpl_vars['resource']->value->HasBufferTime()) {?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceBufferTime','args'=>$_smarty_tpl->tpl_vars['resource']->value->GetBufferTime()),$_smarty_tpl);?>

	<?php } else { ?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceBufferTimeNone'),$_smarty_tpl);?>

	<?php }?>
</div>

<div class="allowMultiDay"
	 data-value="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetAllowMultiday();?>
">
	<?php if ($_smarty_tpl->tpl_vars['resource']->value->GetAllowMultiday()) {?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceAllowMultiDay'),$_smarty_tpl);?>

	<?php } else { ?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceNotAllowMultiDay'),$_smarty_tpl);?>

	<?php }?>
</div><?php }
}
