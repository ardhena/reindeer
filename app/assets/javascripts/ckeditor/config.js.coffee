CKEDITOR.editorConfig = (config) ->
  config.language = 'en'
  config.width = '725'
  config.height = '600'
  config.toolbar_Mini = [
    { name: 'document',    items: [ 'Source','-','Save','DocProps','Preview' ] },
    { name: 'clipboard',   items: [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
    { name: 'editing',     items: [ 'Find','Replace','-','SelectAll' ] },
    { name: 'tools',       items: [ 'Maximize', 'ShowBlocks','-','About' ] },
    { name: 'links',       items: [ 'Link','Unlink' ] },
    { name: 'insert',      items: [ 'Table','Smiley','SpecialChar' ] }
    '/',
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    { name: 'styles',      items: [ 'Styles','Format','FontSize' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
  ]
  config.toolbar = 'Mini'
  true