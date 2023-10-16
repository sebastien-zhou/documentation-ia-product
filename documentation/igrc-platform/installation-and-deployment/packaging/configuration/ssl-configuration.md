---
layout: page
title: "SSL configuration"
parent: "Configuration"
grand_parent: "Packaging"
toc: true
---

In order to activate SSL with a custom certificate, you will need two files:

- `\<hostname>.crt`: The certificate to use
- `\<hostname>.key`: The private key used when generating the certificate

> :warning: The Following the naming pattern is mandatory. For instance, if your hostname is `demo.acme.com`, the corresponding certificates must be named:  
>  
> - `demo.acme.com.crt`
> - `demo.acme.com.key`

# Configuration

You can use the cli to activate the TLS option.

```sh
brainwave config --tls
```

# Certificate location

## Server Mode

The files are to be placed in the folder: `/etc/brainwave/certificates`.  

Make sure that the owner and permissions are correct on the folder.  
Set `brainwave` as the owner, and give read & execute rights to all users:  

```sh
sudo chown brainwave:brainwave /etc/brainwave/certificates
```

## Desktop Mode

The files must be placed in the docker volume called: `bwcertificates`.  
Find the path of the volume in your local deployment place the files inside the volume.  

# Certificate generation

## LetsEncrypt certificate using certbot
{: .d-inline-block }

**optional**
{: .label .label-blue }

These steps allow to generate letsencrypt certificates using certbot on an Amazon Linux instance. Given that the instance has a valid public IP and that the port 80 is open and reachable on the internet.

For more information on how to use certbot on your environment , please refer to: [https://certbot.eff.org/instructions](https://certbot.eff.org/instructions)

```sh
sudo amazon-linux-extras install epel -y
sudo yum install -y certbot
sudo certbot certonly --standalone
```

Follow the wizard, certbot will ask for your email and the domain.

Now lets copy the certificates to the good place. Make sure to adjust the example paths

```sh
sudo cp /etc/letsencrypt/live/pkg-lab.test.brainwavegrc.com/privkey.pem /etc/brainwave/certificates/pkg-lab.test.brainwavegrc.com.key

sudo cp /etc/letsencrypt/live/pkg-lab.test.brainwavegrc.com/cert.pem /etc/brainwave/certificates/pkg-lab.test.brainwavegrc.com.crt
```

## Self-signed example
{: .d-inline-block }

**optional**
{: .label .label-blue }

If you do not have the required files you can generate a self-signed certificate using the following commands.  

```sh
openssl req -newkey rsa:4096 -keyout brainwave.local.key -out brainwave.local.csr
openssl x509 -signkey brainwave.local.key -in brainwave.local.csr -req -days 365 -out brainwave.local.crt
openssl rsa -in brainwave.local.key -out brainwave.local.key
```

<span style="color:red">Important:</span> These commands are provided as an example and **MUST** not be used in a Prod environment.  