Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2FBD74B0BB
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Jul 2023 14:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbjGGM1K (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Jul 2023 08:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbjGGM1J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 08:27:09 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7645119B2;
        Fri,  7 Jul 2023 05:27:05 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso19851225e9.2;
        Fri, 07 Jul 2023 05:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688732824; x=1691324824;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nciTqFzq3m83C37bVuS25/vbGoA9jD+37yyxJfMtABw=;
        b=ZNIHElwkb0VEXSHoF0tGuHcp1TVifo58gxj5pt5t6hd0iqJUb6JD2ugaZdUNiEKeHP
         Putj1KHdjJFh9rxJLYktjlUirzCROnaJNFs93GCLVYv1+qerITfgn2VkTwnp0ID2gmmC
         zzvD3TiQ9GqUfgL9o8TAlB9SPIeVEu6ph+aQ3lY61FlRVDDxLQVuJOJlCTIhDcL0tJ6+
         kaMiCxDFGphUaqkYlWQufcA/+v711O7RHzcIVoxe5mCpFJvQDOwsp2qUh6Ys+1hQUMJU
         St3j/5j9fPEmDSPdC2tnSRFE999WBcD0c9afnKBT9koaKtVfVrpG1uh7mw5q/HJbhL4d
         QEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688732824; x=1691324824;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nciTqFzq3m83C37bVuS25/vbGoA9jD+37yyxJfMtABw=;
        b=DFFDr4R/jzK5qePyNDFrsvAbzA0RJ5kb2D1Swp0T1x7NxFqBqdqNabDpqCURyLFq/Q
         uCBVuPVY5NaqD13/jzz8pcm8dxCNN14mBatNT8gbOni6sm7UZinYADACMNi8oLKvwJfH
         up6KOqcWwEsWvS5J7LteOv5yTeg75n28cIrKJMnuOZUvwGOqSpMvtv099hwH29OU3Gt6
         4WN4uUKqLKhyG0q+oYeul2zB0oMWldC43RpunIEE7QyjSgOqFfLtpivWKN5zB1hxi5Lm
         9T6YLSgq4hI0hNBOkekBxzg7rFUP+fgiYVKpVh+aAFnRl/aguY34QOcXnPsj/6/Be1mJ
         5tHQ==
X-Gm-Message-State: ABy/qLYFcf+vSNSMHtbrj4+cxSATDxi/cjWxbzMqGl8mx68C3xUQHb7+
        Z1D03d1BjkRBeVLyJ1HECls=
X-Google-Smtp-Source: APBJJlG4wejAtuzFwuAno7AbNiD6c/xCroAdDwnXIE0jz7PtmMPhUKO4Rc5+t/vC7H7oMYbYpfu0iw==
X-Received: by 2002:a7b:cc9a:0:b0:3f9:c0f2:e1a4 with SMTP id p26-20020a7bcc9a000000b003f9c0f2e1a4mr3680341wma.34.1688732823578;
        Fri, 07 Jul 2023 05:27:03 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id x4-20020a05600c21c400b003fa74bff02asm2328318wmj.26.2023.07.07.05.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 05:27:03 -0700 (PDT)
Date:   Fri, 7 Jul 2023 14:27:01 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 03/12] drm/tegra: Use fbdev DMA helpers
Message-ID: <ZKgElQ7E3jN4gZv2@orome>
References: <20230707083422.18691-1-tzimmermann@suse.de>
 <20230707083422.18691-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b6kExiNv+/vFdEiT"
Content-Disposition: inline
In-Reply-To: <20230707083422.18691-4-tzimmermann@suse.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--b6kExiNv+/vFdEiT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 10:31:54AM +0200, Thomas Zimmermann wrote:
> Use fbdev's DMA helpers for fbdev emulation. They are equivalent to the
> previously used system-memory helpers, so no functional changes here.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Kconfig | 2 +-
>  drivers/gpu/drm/tegra/fbdev.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--b6kExiNv+/vFdEiT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSoBJUACgkQ3SOs138+
s6GxAg/9FUZU5bvbmvYmw09JA2QTqFtvZ7EfyPB2eYDw9cyXBHv3+N+JxLHYyUUM
PVsoWw/szCPU9rvFRcm+MmakHkpxuoBlrB29uB8TSdKDzyYdSUFkRMdugKAcz78L
zjXIXooqgZbObY/kVQzMHcp9411++fwAv2jcB/DtlzrZii/0aNug6TduPIxxltm0
OPe4kESRnb+pR+ikU5+OQ2WHdDDxINoYzrJbHf5zfHWclseshrWG9ERttjgL9usE
7pthMg02TSpbQOI34O3z7DUZvA2/HgrqQFY0RvMuJ2MqmBpjY32b2R/WAf6FZ8Rv
5yFsb/3fo5UbHZiYTuY2lWo3zJ8AFYT5cgHviyBXqFbAqYwmLM6L5jUrNO0j69OW
d2KUNHiCPkUpx/vqHWUB6Aw1BHkUnNy4r4jamCwR4gcvsJKkdV8+dRA1B7Eh9jac
Obb9gVb0JL9ukBrGOGTTh0tGI1WvkwEeVmEkNEhCvLMfK1S8PJoBcLIdvdWcZznU
JQxHJ3u0R0IZmzo2VhhHs1h7EbGNmHStvKFWlEIDNqh9xAv+zMiADzr/D8bX4db6
wuqbLsRAkedumpk1TjN55hgz88Mhc5LVyqMjSxJXzvH7+LeBvX3KOauwi1GYoTO4
e6UWuA8iMN5+WpskFdl96BjlRYjfpCLEYnhMalMJFUKOFdzIqrE=
=CXji
-----END PGP SIGNATURE-----

--b6kExiNv+/vFdEiT--
