Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69CA517667
	for <lists+linux-tegra@lfdr.de>; Wed,  8 May 2019 13:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfEHLDr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 May 2019 07:03:47 -0400
Received: from mout.perfora.net ([74.208.4.197]:48123 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbfEHLDq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 8 May 2019 07:03:46 -0400
X-Greylist: delayed 309 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 May 2019 07:03:45 EDT
Received: from marcel-pc.toradex.int ([46.140.72.82]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MF2JZ-1hUbgG3AoF-00GI7z;
 Wed, 08 May 2019 12:58:20 +0200
Message-ID: <bb000812478170469e5b0b902147594ff153d1ce.camel@toradex.com>
Subject: Re: Patch: PCI: tegra: Use generic accessors where possible
From:   Marcel Ziswiler <marcel.ziswiler@toradex.com>
To:     Bernd Kubu <bernd@kubu.at>, Thierry Reding <treding@nvidia.com>
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
In-Reply-To: <c4c235a9-89a8-736b-718a-b38861deb470@kubu.at>
References: <e6ea626b-21c2-9b7a-9776-e333609c350b@kubu.at>
         <20190507193942.GA1090@ulmo> <c4c235a9-89a8-736b-718a-b38861deb470@kubu.at>
Organization: Toradex AG
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 08 May 2019 12:58:14 +0200
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WvBNpJ2sNTZt3ZRGpdq6REhvX71hyYZYljglx64MloLBgTZ1ogh
 fZkILgann4yvwryzZk+m1jQYYlA2Kx41qDRiPdtp0vwZ67epfsFQPmJFK4uqTODNXFvxgy/
 nQT6L35Bc2aOPBzoOXKo6qaLHtR+sAC3LSo5BFXNv35YSiOnXwu8cXppSO91kkyU9dW7RRX
 kn6zlsOi1D/yekd2BAEyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q0vNYk06vq4=:GGv9qbWVCvkxpm2jWQ6nPp
 8P3faw4APRYu0VTtFHdAb/LwyvjCHWobJ7Ou0tOremG/Nqx+oXxbYgrZ0b82yuhOVpiLd7Pso
 nt4u9XYJR4z9MXcpqYJhoGc0coqL4N4Yd8PHhQvtpPqgOfaFmJr7K13ppViS6r/Z+OT9WsRj9
 yf8hcdfBEMZQxJWIsVjKwlZcmZo5LRCLWTQxJ7g4vFZh/dM4J13gCB/FleZpCx3M98f78g5sC
 GW7E2bvI8m+kJrIJzihbvVBV7JHZsZhQMKqQ5+LS9yMBeITicHqkAG1pDZVykKzKKWIgzxkJL
 H36exYVcMQw7cbqnxH7RDY+SphsI279WXFfZiPhg7hfDXJjYtlvefyqnHC0DRCxhoNNgbNVx6
 832ObrTa6t3bqofi9ZGcd2BsS9/oWJWkMvWinNKVk3pDemM13EeKIIIZwhD/ZMxpDET4DzG1i
 MGN/CKfjXuXwKkYTUWcFzXh+uqC4JthKIViqJ9J22gsgFLJiEn6zbL20pEtcK2L5c4WWOM17e
 Ulr2pguoYcti4YoA4PX0JmYKwr6kedaOIvJ1QcdhXvkSEXN0Oe3H3t9IaI0tFxmmmMGNQBlIx
 RtbrdfJ+1fMCTiVXuuY4gj4nka3a8BKRlDSrF2K3dvKYzsZpYQ5WXCsqrx5m0GiAs/1wD/LBf
 1sGp3mFuZLxnrrBp/OjCFzYaDzy2abuI12msATATK1Udce+hFxq9mMqGT1UTZQKHctTsObGYd
 VqhVnnK7U1Q0/JpZIbZIeNzR/PsWxhV3sRg2V0dsH23wX1CjJpEUPCvuwIdXnRvduM54BKGSv
 08NX0YR
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Bernd

On Wed, 2019-05-08 at 07:40 +0200, Bernd Kubu wrote:
> Hi Thierry,
> 
> I try to be a bit more specific with this mail:
> 
> My hardware is a "Toradex Apalis TK1 2GB V1.1A".

Please note that anything before V1.2A is considered obsolete sample
hardware [1] which may or may not perform as per your requirements.

> I work on the current Ubuntu Bionic-Kernel (18.04) [1], which is a
> 4.15 kernel.

Please note that 4.15 is long since obsolete [2] and not any of the
still supported long term variants.

> As you already mentioned, the patch [2] was added in 4.15. The
> Toradex-patchset [3] was originally for 4.14.

Please note that any such downstream patch set is quite exclusively for
that particular kernel version and most possibly may not apply to
anything else. In your particular case, it also most likely also does
not even make any sense at all as 4.14 is a still maintained long term
kernel while 4.15 is simply obsolete.

> I applied this patchset [3] to the bionic-kernel. A minor
> modification was necessary to get it to work [4]. (I am currently
> testing with the other toradex-peripherals)

As mentioned above I don't think this makes any sense at all.

> With this setup, the igb-driver for the onboard Intel ethernet
> network controller [8086:157b] does not initialize correctly. I get
> the following messages in dmesg:
> [    4.913881] pci 0000:01:00.0: [8086:157b] type 10 class 0x020000
> [    4.913913] pci 0000:01:00.0: unknown header type 10, ignoring
> device
> It seems, the reading of the pci-header-type is not correct. It reads
> "0x10" instead of "0x00" reproduceable. After comparing the kernel
> changes between 4.14 and 4.15, I found the changes of patch [2] and
> removed it for a test. Without this patch, the igb-driver initialized
> correctly and the network controller worked. So, I assume, there is
> still an issue with other than "pci_generic_config_read32" access.

This is the very first time I ever heard of any such issue. Any and all
mainline version always worked just fine and still do as of the latest
next-20190508.

> So, I want to say, that if I use pci_generic_config_{read,write}32()
> for all accesses, the network controller works for me. And it doesn't
> work, if I use the tegra_pcie_config_{read,write}() functions for
> accesses.
> 
> I didn´t try it with a recent kernel. I assume, more modifications of
> the Toradex-patchset are necessary to get it to work. If you intend
> to track this issue for the recent kernel, I could give it a try..

This is quite clearly a non-issue as it works just fine in mainline.

BTW: For further downstream discussions you may want to revert to our
community forum [3] rather than bothering busy mainline maintainers.

[1] https://developer.toradex.com/products/apalis-tk1#revision-history
[2] https://www.kernel.org
[3] https://www.toradex.com/community

>     Bernd

Cheers

Marcel
Platform Manager Embedded Linux
Toradex

> [1] git://kernel.ubuntu.com/ubuntu/ubuntu-bionic.git
> [2] https://patchwork.kernel.org/patch/9967399/
> [3] 
> http://git.toradex.com/cgit/meta-toradex-tegra.git/tree/recipes-kernel/linux/linux-toradex-mainline-4.14?h=rocko
> )
> [4] patch1 below
> 
> --- patch1 ---
> diff --git a/drivers/iio/adc/apalis-tk1-k20_adc.c
> b/drivers/iio/adc/apalis-tk1-k20_adc.c
> index b45e51df5c81..8a9d90b2f77d 100644
> --- a/drivers/iio/adc/apalis-tk1-k20_adc.c
> +++ b/drivers/iio/adc/apalis-tk1-k20_adc.c
> @@ -87,7 +87,7 @@ static int apalis_tk1_k20_adc_read_raw(struct
> iio_dev *indio_dev,
> 
>  static const struct iio_info apalis_tk1_k20_adc_info = {
>         .read_raw = &apalis_tk1_k20_adc_read_raw,
> -       .driver_module = THIS_MODULE,
>  };
> --- patch1 ---
> 
> Am 07.05.2019 um 21:39 schrieb Thierry Reding:
> > On Tue, May 07, 2019 at 04:03:37PM +0200, Bernd Kubu wrote:
> > > Hello Thierry,
> > > 
> > > I have troubles with this patch: 
> > > https://patchwork.kernel.org/patch/9967399/
> > > 
> > > My Intel Ethernet Network Controller (igb [8086:157b]) on the
> > > "Toradex Apalis
> > > TK1 2GB V1.1A" does not work with the current Ubuntu Bionic
> > > Kernel (with
> > > patches from 
> > > http://git.toradex.com/cgit/meta-toradex-tegra.git/tree/
> > > recipes-kernel/linux/linux-toradex-mainline-4.14?h=rocko).
> > 
> > Looks like the baseline for that is 4.14. The patch that you
> > referenced
> > above was applied to 4.15 and is not part of that Toradex patchset
> > either, so...
> > 
> > > I get the following messages in dmesg:
> > > [    4.913881] pci 0000:01:00.0: [8086:157b] type 10 class
> > > 0x020000
> > > [    4.913913] pci 0000:01:00.0: unknown header type 10, ignoring
> > > device
> > > 
> > > After removing the changes from the patch 
> > > https://patchwork.kernel.org/patch/
> > > 9967399/
> > > ---------
> > > 
> > > > +}
> > > > +
> > > >  static struct pci_ops tegra_pcie_ops = {
> > > >         .add_bus = tegra_pcie_add_bus,
> > > >         .remove_bus = tegra_pcie_remove_bus,
> > > >         .map_bus = tegra_pcie_map_bus,
> > > > -       .read = pci_generic_config_read32,
> > > > -       .write = pci_generic_config_write32,
> > > > +       .read = tegra_pcie_config_read,
> > > > +       .write = tegra_pcie_config_write,
> > > >  };
> > > > 
> > > 
> > > ------
> > > 
> > > the Network Controller work.
> > > So it seems this model has issues with other than 32-bit access.
> > 
> > ... I'm not sure how that would be related here. Unless I'm
> > misunder-
> > standing what you're saying. You are saying that if you use
> > pci_generic_config_{read,write}32() for all accesses, that the
> > network
> > controller works for you? And it doesn't work if you use the
> > tegra_pcie_config_{read,write}() functions for accesses?
> > 
> > I'd be somewhat surprised if this wasn't working. I'm not aware of
> > any
> > similar reports against the upstream kernel. Have you tried
> > building a
> > recent linux-next, or -rc or something like the latest release
> > (5.1)?
> > 
> > Adding Marcel here, perhaps he's encountered a similar issue. Also
> > adding the linux-tegra mailing list for broader visibility.
> > 
> > Thierry
> > 
> > > Best regards,
> > > 
> > >     Bernd
> > > 
> > > --
> > > Bernd Kubu - IT Services
> > > 
> > > Heufeldstrasse 24
> > > A-2640 Gloggnitz
> > > 
> > > Tel.: +43-699-13002768
> > > E-Mail: mailto:bernd@kubu.at

