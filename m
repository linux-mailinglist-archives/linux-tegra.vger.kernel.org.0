Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 142661991AB
	for <lists+linux-tegra@lfdr.de>; Tue, 31 Mar 2020 11:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731815AbgCaJUp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 31 Mar 2020 05:20:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:40342 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730568AbgCaJUk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Mar 2020 05:20:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 72CB5AEF7;
        Tue, 31 Mar 2020 09:20:37 +0000 (UTC)
Subject: Re: [PATCH 20/22] drm/vkms: Use simple encoder
To:     Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        abrodkin@synopsys.com, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, jingoohan1@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
        xinliang.liu@linaro.org, zourongrong@gmail.com,
        john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
        puck.chen@hisilicon.com, linux@armlinux.org.uk,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
        matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
        tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
        hamohammed.sa@gmail.com, sebastian.reichel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-21-tzimmermann@suse.de>
 <20200324115905.dp5jqzbmvhbmk2rn@smtp.gmail.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <eef912e5-7ab4-f8bb-6ea9-47db1c05312b@suse.de>
Date:   Tue, 31 Mar 2020 11:20:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324115905.dp5jqzbmvhbmk2rn@smtp.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7lVXjZmTpLLkTKch5Y4I1GCt7Pec0fulW"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7lVXjZmTpLLkTKch5Y4I1GCt7Pec0fulW
Content-Type: multipart/mixed; boundary="q11qeQog61ztY5ZBs8aYmUz8BfkF0OSCB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 abrodkin@synopsys.com, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jingoohan1@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 linux@armlinux.org.uk, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
 matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
 hamohammed.sa@gmail.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org
Message-ID: <eef912e5-7ab4-f8bb-6ea9-47db1c05312b@suse.de>
Subject: Re: [PATCH 20/22] drm/vkms: Use simple encoder
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-21-tzimmermann@suse.de>
 <20200324115905.dp5jqzbmvhbmk2rn@smtp.gmail.com>
In-Reply-To: <20200324115905.dp5jqzbmvhbmk2rn@smtp.gmail.com>

--q11qeQog61ztY5ZBs8aYmUz8BfkF0OSCB
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.03.20 um 12:59 schrieb Rodrigo Siqueira:
> Hi Thomas,
>=20
> First of all, thanks for your patch!
>=20
> I applied all your series, compiled it, and when I tried
> `make INSTALL_MOD_PATH=3D/PATH/ modules_instal` I got the following
> message:
>=20
>  depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper=

>  depmod: ERROR: Found 2 modules in dependency cycles!
>  make: *** [Makefile:1317: _modinst_post] Error 1
>=20
> I cleaned up my local files and tried again, but I got the same error;
> If I just use `drm-misc-next` everything is fine.  Did I miss something=
?

I didn't change any module dependencies. Does it happen without this
patches?

Best regards
Thomas

>=20
> Thanks
>=20
> On 03/05, Thomas Zimmermann wrote:
>> The vkms driver uses an empty implementation for its encoder. Replace
>> the code with the generic simple encoder.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/vkms/vkms_output.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms=
/vkms_output.c
>> index fb1941a6522c..85afb77e97f0 100644
>> --- a/drivers/gpu/drm/vkms/vkms_output.c
>> +++ b/drivers/gpu/drm/vkms/vkms_output.c
>> @@ -3,6 +3,7 @@
>>  #include "vkms_drv.h"
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> =20
>>  static void vkms_connector_destroy(struct drm_connector *connector)
>>  {
>> @@ -17,10 +18,6 @@ static const struct drm_connector_funcs vkms_connec=
tor_funcs =3D {
>>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,=

>>  };
>> =20
>> -static const struct drm_encoder_funcs vkms_encoder_funcs =3D {
>> -	.destroy =3D drm_encoder_cleanup,
>> -};
>> -
>>  static int vkms_conn_get_modes(struct drm_connector *connector)
>>  {
>>  	int count;
>> @@ -70,8 +67,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, in=
t index)
>> =20
>>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
>> =20
>> -	ret =3D drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
>> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>> +	ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTU=
AL);
>>  	if (ret) {
>>  		DRM_ERROR("Failed to init encoder\n");
>>  		goto err_encoder;
>> --=20
>> 2.25.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--q11qeQog61ztY5ZBs8aYmUz8BfkF0OSCB--

--7lVXjZmTpLLkTKch5Y4I1GCt7Pec0fulW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6DC2IACgkQaA3BHVML
eiPLVgf/ZsAHhwHhc6AopeQ3Jo5QFB+n+OZPi4AH9wfFrisYkvbEt6RhbDd4VCb0
mvTi97EzYLGovrH11SYIE+INA07OTuQbKOKVxoB9UfXzFRuD8OeK3l0yHmVCKZzv
/vU4cB7QBbS4dt//B9KlgxfQvq1T/bTPfZZbmf6ozduo9I3bR8xOj2V433wGdkQi
0fjSzQ4WuFrfLv2Zn/D70oxZbm81vsBMWkq1jy/b/5iUDU6W7uHxQemiYMvtMBO2
XwtBSX2PWyAaG43mW0QcdvhLOEgnNc62t5v78P9MRFsC7Fd/F7PkahlwCkPSFEgx
71iw2TEYpRvkMO33t6TI5x6xofZO9g==
=Yoq6
-----END PGP SIGNATURE-----

--7lVXjZmTpLLkTKch5Y4I1GCt7Pec0fulW--
