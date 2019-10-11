Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91912D3B53
	for <lists+linux-tegra@lfdr.de>; Fri, 11 Oct 2019 10:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfJKIhw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 11 Oct 2019 04:37:52 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15100 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfJKIhv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Oct 2019 04:37:51 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5da03f600000>; Fri, 11 Oct 2019 01:37:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 11 Oct 2019 01:37:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 11 Oct 2019 01:37:51 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Oct
 2019 08:37:50 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Oct
 2019 08:37:50 +0000
Subject: Re: Kernel panic 5.4.0-rc1-next-20191004
To:     =?UTF-8?Q?Milan_Bu=c5=a1ka?= <milan.buska@gmail.com>,
        <linux-tegra@vger.kernel.org>
References: <CAFCWPP+SHYrN7=oz64DTTNtRU6hv3=gM=WjO3Sn-32HMe5g2+A@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <21d7393e-6fba-d23e-3e0e-610503ea8fab@nvidia.com>
Date:   Fri, 11 Oct 2019 09:37:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFCWPP+SHYrN7=oz64DTTNtRU6hv3=gM=WjO3Sn-32HMe5g2+A@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1570783073; bh=MyO68ZDS7MjQiDgES19dvjPBf48eSOAG1d7AHyqh3CU=;
        h=X-PGP-Universal:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=JNILrDs5xFD/7+wPN2PlEhvEGCnGq03mjkW4r+ohoANGHshFuHH2N87HWTb7xhOaO
         Za+jq19Iq+biYGoJj8nhewdu/fy5K0a62oVCyYuNh1FDewmep8jND3Jkp2di8Lbyeo
         9lCyLRXFredt6oT97NmIery5BLNUEsukKZDOAQvcEbtR0tWj8VNoYiDrb/7mKgxmjy
         SXIGdnnaF0k/MXSvqZxIeQLBQkJyjycp57GIjpziLcKOoxW8Hfe/C1BtTuuH7Xdd9j
         pzSI0rM0GyfQTHvVdwxw9ZLRbM/fGOjRNlMYYqaERAs+kv9DyMOO6+4A84Jn2KxSxe
         2rqE096Cu+l4g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 10/10/2019 16:35, Milan Bu=C5=A1ka wrote:
> Hello.
>=20
> Kernel compilation for testing on Jetson TX2 Developer Kit
> resulted in a Kernel panic error.
> I did the compilation while running the 5.4.0-rc1-next-20191004
> kernel, which I had previously compiled on the NVIDIA kernel
> I did the compilation directly on the device (without the cross compilati=
on)

Any chance you could try to bisect this? I understand it is a bit of a
pain because you need to run the compile every time, but if this is
failing 100% with this version it would be good to see if it could be
bisected.

Cheers
Jon

--=20
nvpublic
