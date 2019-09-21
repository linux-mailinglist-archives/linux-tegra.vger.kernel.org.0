Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B9FB9F7D
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Sep 2019 21:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732278AbfIUTEL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 21 Sep 2019 15:04:11 -0400
Received: from mout.web.de ([217.72.192.78]:34625 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729044AbfIUTEL (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 21 Sep 2019 15:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1569092640;
        bh=7Tg1Yc39xzenqYSWdGNeeQlOnwRtZ7+BVwsmOwCoArU=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=lMXPUD9aS0bSdfDOiBmIhvCbQkBpwgjTyzC8BqkWJXKrsSbNKWrxG0U/pBzKrOM1j
         /I3OIM2JZkV/obLjf5TQQ3sY1FkEKHf1L8ywadzYN3x+4x00FFIRZkAkLns/VCkMNi
         z503MfBeMoklAH/N3N8buHoIM/jJ65wrjM90t+Es=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.64.44]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LmLoU-1hc90U0WKg-00a0LR; Sat, 21
 Sep 2019 21:04:00 +0200
To:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Arto Merilainen <amerilainen@nvidia.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/tegra: vic: Use devm_platform_ioremap_resource() in
 vic_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Andrew Chew <achew@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Message-ID: <50adb1d3-93fc-44c1-9988-02036911ee46@web.de>
Date:   Sat, 21 Sep 2019 21:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ear2+ZWGYZCCOHo5WiDNX1An9lw8SlgPmVPGUU67jagu+Q6vgqo
 LST35OMQIlbcoByW4YRUhS2CUCe6GDvw54vJWWmxNqza7W0tfrHudq5o8w6gRuEI0if8eW+
 p5nT1++FD7YT0CLbacTWCUeGJp8+2IPtGDEWz3kaDytZvkJ/E9vWPquD8aUlJX4E0TejUSS
 ITdVgBF3ICrXzoyhCOBTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CaCKB7VbyaI=:L103ETXJzBvExrNjH4GQcn
 4yVUJK9oKnpiZ1TMMAo9MGZa4iKDIKUntUPr36Ac3sbv+y5eLhVWx3AmtP5a7da91mJjdScJZ
 j3a2DGJjyKMe+WyDX4Xg+HWx0WrSr+2M+x1EjQHabp/rmnSIYOdiNEDu9wB8oXE37pQTW+GAZ
 a7CEVjyRt2tsE6LStHAOq7v0PNIDTZF2GX1D0HmW124DrHs7p2G9B609Z35fh90iyCPNXvhV4
 jxI2HEemUtGdTgJK0e+xphtHdSH8KgrXQ5gvQFdIjEEeH/N+2o/uSW+uprX9uGHUDY87Zq2Pz
 DHvHkeU0p3QXfU+dYksTBIRRh3fOKN/lYn114L7uLOuI9tlfACc8kAF/mPeZ7P59im9Is48wj
 iqCc8OVeUVGHSWtC95/7519D4f8Sm2cjJ3/rtuIrfB9uPxiTOVRO2/fD67hgdzR1tSK/qpwxn
 cK67Ch+JhuD1tZT8ZPaZgcmqDvqSxK7Rq8IO9qkp8p2ZWhvK1Qw+YBJe1Efopxn1w8bS/NGdQ
 Gz1fSlhgGJEVO8kLJFnOs2NJZicvs7Rs5XpsYnZdLM8gEfGOFIhZrUnZbZjMkCocOU1CxMBMv
 RauJcDvID1KZLzYqF/YUxS7AbEX4eNFQ1AjIW8JnYjvM8DjgMusKEBlOI+oAVAMNEhJlgY7xa
 8bKwpbGz0lF1BcfsmPtKZXOI8KjkXnsYLlRKzNhvVvNpBA8l5WeWPdXiuQSknwNgJERJ1GbcM
 iYSxwq5HR4S0G3d8oF0ymYgNOQgbRohDR7k4/76af5RprZpfMKRIb4BDCbaBoMd55TlpjfEU3
 nFKgUrHoZCmzHXq0I4i08R1gWqmZPKEddq36DljQTwe/p26CcjRcoYjUayDhQB4v2oIdW2vjj
 HAQU1G6+SQDK+kM1Ef4blT+Iatez0xbUn+xJl2y9OvShqBWOsa4AuVvX3HX5j4G7HGmWYG/BG
 PeTgvNJ91aERNC+Txrt1x7btOZiAOyim3ALQJqpdo52sFNVY2jOHOb3kDYocR51SrxoATiQ5a
 Xty38xK3aSPdonAWxGpbts+vkVym7+kr7+InBH/2VXtcu4AnYz0iGP4jRtrX+82sLjlIPIDHE
 34BekncIIH0USu0hgYc9N9rNHGS4a+ViywJv6mZpq9Dw4tz9uxSGMlbXru+5M86g55gew1fSY
 etTATE8jxylzx0wqx/QQLYwHlziCwWkVMXSuw9jqoIBqgHNiwvpimo/4ToCURiplF2E4wT+G7
 mM4fOe9YBZqc0m8LNVsSwMdPMv3jn6F+Gu72OiPgrz1AFKV+UPIYq/c7cRl8=
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 20:51:52 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/tegra/vic.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index cd0399fd8c63..bc72d326588b 100644
=2D-- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -370,7 +370,6 @@ static int vic_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
 	struct host1x_syncpt **syncpts;
-	struct resource *regs;
 	struct vic *vic;
 	int err;

@@ -384,13 +383,7 @@ static int vic_probe(struct platform_device *pdev)
 	if (!syncpts)
 		return -ENOMEM;

-	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_err(&pdev->dev, "failed to get registers\n");
-		return -ENXIO;
-	}
-
-	vic->regs =3D devm_ioremap_resource(dev, regs);
+	vic->regs =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vic->regs))
 		return PTR_ERR(vic->regs);

=2D-
2.23.0

