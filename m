Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E355A361192
	for <lists+linux-tegra@lfdr.de>; Thu, 15 Apr 2021 20:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbhDOSAv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 15 Apr 2021 14:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbhDOSAu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Apr 2021 14:00:50 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69067C061574
        for <linux-tegra@vger.kernel.org>; Thu, 15 Apr 2021 11:00:27 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id e7so29088773edu.10
        for <linux-tegra@vger.kernel.org>; Thu, 15 Apr 2021 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UTwhTiq7D0EG1VtR8EmuKyo1zpQH4L9rGLfT4UoA/Vs=;
        b=hXSYHomiRUxQ3S28NgYhbgU8mbXk0YwOXO06AKNBNIGP5fkmx4p7gCqkReqFhas9Ab
         SoAWEgYGtAK+vlDS6RcMCBe6KuueqePAHSsd1vaJwHyKCM1iFFvP4BFSBLDzYVUoRukV
         GuCYwqINA2SQHBZlhrINh8WmfgXG1sT61hc2akI67wOXMsplw586jvl2iH1uZ1zmpKbP
         gYUTa6qdjoRQV8kc+u9cOGbD2uoj5qcZneBOpiVDYBzRQe50UwYFMaCMo4YHvHKIFl9m
         UNJWUVSW6+bnS3ein6G+qV55S8R0UjoVV0T4L0Y9GzBxiGBFIWVvmFo3K+6JIKraSEQA
         llUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UTwhTiq7D0EG1VtR8EmuKyo1zpQH4L9rGLfT4UoA/Vs=;
        b=H9vNA8JfdCIdoxZ048UlPWPwFhOsSqvFStBT9GWrn88kgq85WLD81tF1VlPdEzLeyZ
         FVROCpneyfSrzwU9eBg4eM0AIFhyrgJ8sU1cy6IUx3YC+gHHyPnPo0QryogYbWboVgFV
         X3t8ckqC2iNXXmoZmUVchONTPCM1GecvQ3ztNyFwc/Jx4S3qOnGrCXnZ4rR+/Q2bExD+
         Q+lGUIhCFSuFGxjr4XfSj87+6hDqcXSTmpbjcsHosoNGr1qnzDnsixe9gLxxIyOx28pw
         jHds5Ig6SEsb6rORw9LyvuNoBnjUo0j9wFesljUnl8Bcr3OT6jNBjjZq7URKFl3zwDmu
         flYw==
X-Gm-Message-State: AOAM531SDSjPsYVAJzid7HtuXBw7w7Zv9Gsoju/kC/ee8jYZ5nb11ajs
        vHMYuJM7MheiP3DzD+/q6Fw=
X-Google-Smtp-Source: ABdhPJz673ntS+hSr9aQOFmCMq8/29t/B68TqiW7t2pPJLIct/i8Idj5e/UCzdh0ip0QlAr+PelYNw==
X-Received: by 2002:a05:6402:518d:: with SMTP id q13mr5702302edd.313.1618509626158;
        Thu, 15 Apr 2021 11:00:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v19sm1742352ejy.78.2021.04.15.11.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 11:00:24 -0700 (PDT)
Date:   Thu, 15 Apr 2021 20:01:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/14] ASoC: simple-card-utils: enable flexible
 CPU/Codec/Platform
Message-ID: <YHh/Y5fXMxm91Ha3@orome.fritz.box>
References: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
 <87v996od2c.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fWIQhJrNn41Dr28Z"
Content-Disposition: inline
In-Reply-To: <87v996od2c.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--fWIQhJrNn41Dr28Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2021 at 01:15:23PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> Current simple-card / audio-graph are assuming fixed
> single-CPU/Codec/Platform.
> This patch prepares multi-CPU/Codec/Platform support.
>=20
> Note is that it is not yet full-multi-support.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/simple_card_utils.h     |  8 +++
>  sound/soc/generic/audio-graph-card.c  | 22 ++++++++
>  sound/soc/generic/simple-card-utils.c | 72 +++++++++++++++++++--------
>  sound/soc/generic/simple-card.c       | 30 +++++++++++
>  4 files changed, 110 insertions(+), 22 deletions(-)

Hi,

This seems to break display support on a Jetson TX2 board for me, though
I admittedly don't quite understand how it would be related to display
at all. Reverting basically the whole series (because subsequent patches
depend on this on) on top of next-20210415, I get working display again.

There's this in the log, which seems to be related:

[   14.671377] tegra-audio-graph-card sound: too many links
[   14.799645] tegra-audio-graph-card sound: too many links
[   14.845375] tegra-audio-graph-card sound: too many links
[   14.853635] tegra-audio-graph-card sound: too many links
[   14.860934] tegra-audio-graph-card sound: too many links
[   14.868781] tegra-audio-graph-card sound: too many links
[   14.875659] tegra-audio-graph-card sound: too many links
[   14.907874] tegra-audio-graph-card sound: too many links
[   14.917351] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000010
[   14.926255] Mem abort info:
[   14.929096]   ESR =3D 0x96000047
[   14.932208]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   14.937559]   SET =3D 0, FnV =3D 0
[   14.940642]   EA =3D 0, S1PTW =3D 0
[   14.943867] Data abort info:
[   14.946753]   ISV =3D 0, ISS =3D 0x00000047
[   14.950611]   CM =3D 0, WnR =3D 1
[   14.953614] user pgtable: 64k pages, 48-bit VAs, pgdp=3D0000000100b94400
[   14.960185] [0000000000000010] pgd=3D0800000102280003, p4d=3D08000001022=
80003, pud=3D0800000102280003, pmd=3D0800000101050003, pte=3D00000000000000=
00
[   14.972774] Internal error: Oops: 96000047 [#1] PREEMPT SMP
[   14.978362] Modules linked in: drm_kms_helper snd_soc_tegra210_admaif sn=
d_soc_tegra_pcm snd_soc_tegra210_dmic snd_soc_tegra210_i2s snd_soc_tegra186=
_dspk cfbfillrect cfbimgblt cfbcopyarea snd_soc_tegra210_ahub snd_soc_tegra=
_audio_graph_card snd_soc_audio_graph_card snd_soc_simple_card_utils crct10=
dif_ce at24 tegra_aconnect tegra_bpmp_thermal host1x drm fuse drm_panel_ori=
entation_quirks ipv6
[   15.012917] CPU: 2 PID: 69 Comm: kworker/u12:3 Tainted: G S             =
   5.12.0-rc7-next-20210415 #108
[   15.022390] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[   15.028303] Workqueue: events_unbound deferred_probe_work_func
[   15.034159] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=3D--)
[   15.040162] pc : snd_soc_get_dai_name+0x124/0x150
[   15.044883] lr : snd_soc_get_dai_name+0xa4/0x150
[   15.049521] sp : ffff800011fef780
[   15.052849] x29: ffff800011fef780 x28: ffff00008bc14980
[   15.058181] x27: 0000000000000000 x26: ffff000081aafc10
[   15.063511] x25: ffff0001f7091680 x24: ffff800011538798
[   15.068841] x23: 0000000000000010 x22: ffff800011538778
[   15.074169] x21: ffff800011fef808 x20: 00000000fffffdf4
[   15.079486] x19: ffff0000809c7880 x18: 0000000000000030
[   15.084813] x17: 0000000000000000 x16: 0000000000000000
[   15.090142] x15: ffffffffffffffff x14: ffffffff00000000
[   15.095468] x13: ffffffffffffffff x12: 0000000000000020
[   15.100804] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
[   15.106135] x9 : 7f7f7f7f7f7f7f7f x8 : feff303f73716e6f
[   15.111464] x7 : 00000000ffffffff x6 : 0000314000000000
[   15.116791] x5 : ffff0001f7091d28 x4 : ffff00008c41a010
[   15.122109] x3 : 0000000000000000 x2 : 0000000000000010
[   15.127439] x1 : 0000000000000000 x0 : ffff8000094614d8
[   15.132756] Call trace:
[   15.135201]  snd_soc_get_dai_name+0x124/0x150
[   15.139560]  asoc_simple_parse_dai.part.0+0x70/0xd0 [snd_soc_audio_graph=
_card]
[   15.146784]  graph_dai_link_of_dpcm+0x100/0x38c [snd_soc_audio_graph_car=
d]
[   15.153672]  __graph_for_each_link+0x1dc/0x204 [snd_soc_audio_graph_card]
[   15.160471]  audio_graph_parse_of+0x148/0x20c [snd_soc_audio_graph_card]
[   15.167178]  tegra_audio_graph_probe+0x6c/0x8c [snd_soc_tegra_audio_grap=
h_card]
[   15.174499]  platform_probe+0x68/0xe0
[   15.178164]  really_probe+0xe4/0x50c
[   15.181754]  driver_probe_device+0x64/0xc4
[   15.185861]  __device_attach_driver+0xb4/0x110
[   15.190314]  bus_for_each_drv+0x78/0xd0
[   15.194149]  __device_attach+0xd8/0x180
[   15.197985]  device_initial_probe+0x14/0x20
[   15.202168]  bus_probe_device+0x9c/0xa4
[   15.206003]  deferred_probe_work_func+0x88/0xc0
[   15.210532]  process_one_work+0x1cc/0x350
[   15.214542]  worker_thread+0x68/0x3ac
[   15.218203]  kthread+0x128/0x134
[   15.221431]  ret_from_fork+0x10/0x34
[   15.225045] Code: fa531004 54ffff81 f9400c00 f9400000 (f90002e0)
[   15.231134] ---[ end trace 671a11645631ca2f ]---

Any ideas what could be wrong?

Adding Jon and linux-tegra for visibility.

Thierry

--fWIQhJrNn41Dr28Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmB4f2AACgkQ3SOs138+
s6HNYBAAk1J+rT+ulfVjWUFrq1a3tTy8N09IMXCR5l4OWCJQ+7YccS61eBbkH5FW
vUQobR88OqqmBkFMyRNF/BgisrCSUf+oJjGSJGuTBGruvrzB9wfYr5Aq8Rh3raRm
3Ko1UvU+zyDeFD8x8U65J6QAhSWBs62DljSrD0+8xkw+FJOBRRLX3lAydSfik2ns
S0VvmhIUj0KcbmPHKEGYA85rrThCkjIp4CQepd6QXmA/k3UreIf4pWy3VmbEqQfY
ypteb++/0qbIrxlF5xEdnsgbSgP7Y8pgJVFeJIlqxSij8xYAVYakDaGIrEhbXrrR
FLIiUTZOXJHgO+IBSmN5ESvCaRew7FISSKoBUd9sg2eSiE2e8/1jegsxkfj98sxI
UOLSHR1bSVQheZqqctaxmXliA1p/aEB4/3sfVzl3MwN3G2Nq6z5//k4QRJ+nv73g
9TeLLjEIYeo0wX1rYzFKOKnaeWMKw4r+KS/OhPs6wcwtPuzh5dybXcyzO+5OCZ61
qBLrH6ZlQ86wurXBtaTK/yV8HFDBMtfsGLMW/A572zhRsdrJr8OJ2Vrg6BEeIWn1
d0pTQgDA8lk0vLEZVMPA39sW4dpWj0V4sAs5L4mhFqlNz/Mi1Rm2WqLm7YPndjxo
zHNJ3ufouyoQg3VioIruqlT5WV/IdV8rosllojECcQ+FvtLKcqI=
=huCF
-----END PGP SIGNATURE-----

--fWIQhJrNn41Dr28Z--
