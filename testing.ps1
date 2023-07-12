 echo "Trigger the testing.ps1" >> PID_main.txt
[void][reflection.assembly]::LoadWithPartialName("System.Windows.Forms")

$img = [System.Drawing.Image]::Fromfile($args[0]);

[System.Windows.Forms.Application]::EnableVisualStyles();
$form = new-object Windows.Forms.Form
$form.StartPosition = "CenterScreen"
$form.Width =  $img.Size.Width;
$form.Height =  $img.Size.Height;
$form.TopMost = $false
$form.FormBorderStyle = [System.Windows.Forms.BorderStyle]::None;
$Form.ControlBox = $False


# for setting the transparent background of the form
$transKey               = "#c0c0c0"
$form.BackColor         = $transKey # [Control]
$form.TransparencyKey   = $transKey

# create the handler for the gif
$pictureBox = new-object Windows.Forms.PictureBox
$pictureBox.Width =  $img.Size.Width;
$pictureBox.Height =  $img.Size.Height;
$pictureBox.Image = $img;
$pictureBox.Add_Click({$form.close()}) # add a click event listener amd close the form when the gif is clicked
$pictureBox.BackColor = [System.Drawing.Color]::FromName("Transparent"); # set the picturebox with a transparent background
$form.controls.add($pictureBox)

$form.Topmost = $true
$form.Add_Shown( { $form.Activate() } )
$form.ShowDialog()