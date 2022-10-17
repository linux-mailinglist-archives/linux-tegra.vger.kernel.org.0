Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C16601141
	for <lists+linux-tegra@lfdr.de>; Mon, 17 Oct 2022 16:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbiJQOjA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Oct 2022 10:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiJQOi7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Oct 2022 10:38:59 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBFD659C0;
        Mon, 17 Oct 2022 07:38:58 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id w18so25386388ejq.11;
        Mon, 17 Oct 2022 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71UDum2d0oKTyyrYpYR53saiIHSJtCoCDLAXfJhuh0c=;
        b=YOUbjnCw6CQ+zeEfv3qNSDqY46R8PCIYzPoFfDBaZLucYbmypPvHxW50NxmaKxPp+v
         3b1jxUGzTfRuKl4tahTyQrJZPRpQymz4LQy+1mJPTPt0p3gIruNxRxFe4zdEu+P1ttLE
         2czHBIjRqa+BBLpesK3o5XgQGzymmWdILwZGmLFJoAaQ/KdzwOdvC1m4ySYZpxG41hqK
         6l6avz8Fz9BD9VC7lvW3Kpd0i+44l4U9PxGOf0f/gj+Z7hCCWpNJZsXzq2EPRZ5E50s0
         cQX7tqsZDolzzJ+UB91ZVbcB0YaGPWOqvF+vMcViRek0bcN/zWJSBfX9mN1kCwg1r/dx
         /2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71UDum2d0oKTyyrYpYR53saiIHSJtCoCDLAXfJhuh0c=;
        b=OyGaeMtVU2KtXxPgG3cKQ4r3fpfaCtARReI0S3DX16X8aDMW8+dyNcV49MJxdootpN
         slZGd5u1/1C/X2O+HcaP7WIYuNSlmS1yYlam8pVhOpJa7at2pRUY8mKbUjWoel8C2Nne
         KZTOFuhTf9WoLI6qxszpyjltydlYvBx3/2qI+OZWFf9u4U0nt75Q/wN6Mf3Vfd6CeQ+Y
         Ckd89bjqopggWhLD7KPb6UxYScHNQR9QKamxCCx480FfwtMFtq9gEL2BGIVNIF2ODCHn
         lEr20ir34xqqE4kSGl5gP4X5tPQpeMoARZnKggzirPiErWx8byenna1+oQQMbTM7u6Aw
         ex2Q==
X-Gm-Message-State: ACrzQf0V1z5Scc/VOwYG4OVdAX+sa8AruA/O/81TqsERx1CgUxzQObmd
        MDgU5Ot15CwLPi+OCnXtozU=
X-Google-Smtp-Source: AMsMyM5B/fqBSYUN5FBCtfdzvZ77V3Tlw079HWU+uo6zYZQQL2kTw4bk3X3MK0XWuUtGmtvWbsdpIg==
X-Received: by 2002:a17:906:dacd:b0:780:a90c:e144 with SMTP id xi13-20020a170906dacd00b00780a90ce144mr8882293ejb.153.1666017537079;
        Mon, 17 Oct 2022 07:38:57 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id x2-20020a50ba82000000b0044eb5b922bdsm7434353ede.24.2022.10.17.07.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 07:38:56 -0700 (PDT)
Date:   Mon, 17 Oct 2022 16:38:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: simple-framebuffer: Support
 system memory framebuffers
Message-ID: <Y01o/ktQGO430tc6@orome>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-2-thierry.reding@gmail.com>
 <44567457-2062-6e16-9a7f-c4ad23809ac9@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oU+6EXuFJR8wOBj7"
Content-Disposition: inline
In-Reply-To: <44567457-2062-6e16-9a7f-c4ad23809ac9@suse.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--oU+6EXuFJR8wOBj7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 11:37:37AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 07.10.22 um 14:49 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > In order to support framebuffers residing in system memory, allow the
> > memory-region property to override the framebuffer memory specification
> > in the "reg" property.
>=20
> What happens if both properties are present and they disagree with each
> other?
>=20
> I understand that the framebuffer is behind 'memory-region', but does 're=
g'
> still contain device memory?  Do we need to acquire ownership from within
> the driver?

The intention is for both memory-region and reg properties to be
mutually exclusive. I can't think of a scenario where you would need or
want both.

Note also the documentation for the memory-region property:

|  memory-region:
|    maxItems: 1
|    description: Phandle to a node describing the memory to be used for the
|      framebuffer. If present, overrides the "reg" property (if one exists=
).

Thierry

--oU+6EXuFJR8wOBj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNNaP4ACgkQ3SOs138+
s6H7iw/9HTbPf+ms8rkbXYj+BazFfadfC6vbV0zPNK0f5t1IYUC8Dk0MYIwjdCAN
KbSNIys+uh1EKjJeClsiJvSBLhrqrZVeVdqruxnLUx3kDYuIWvwJBcF4RJE/3SoG
wS2nU80/E4q56dTqRyMxMYfwM86fnAFm26TxZul0Oa4prNc7KV+ixrQKybszACLa
sAQ5F9FimcyngTFIspuT6v7a+rhS9H7uFjOKFQirfBw57aA7gsb2VMpH4UMOx77n
UA9xa9XqRU9M3A6DC/W80XikkbBAK6eOCHrFIyaIM69KPnrdLhu40BbcqS7ol8Jw
tkKRK3rO5FPQSGj1kV+oY9S8wE6p8lUl26Wh6HcLxZfIUH+SYP3AZ/TDIwX1LPiU
7ETTkD5UJZRoTXt36FFt7dwGEiBpmbAuKwsa+M1zlTi5mnzOlqNzxmP7T0XpnDKQ
QaF5wRp7yd+hrzrTOhq/XC4Nxih7dCDqG5Ige7EpY14NopzwXeiH0FKNXlq2Y0FD
CnbxXPCl+Eitf2M8bCkn0n43LjxLpxEqJLUeM0ZyZTzBzu39wx4J2nyZX5KMUsCK
lh3d1x5Z0nD99lNrIVlxPLwFkUw50gDwn3NiPcfzuAAOpmrcmpugtp3lMtIJ4hyf
F9KSI+8HNSGujTApANyy6mvp+T8buDgv9VoOd4A85RhJhNIprkI=
=jBYl
-----END PGP SIGNATURE-----

--oU+6EXuFJR8wOBj7--
