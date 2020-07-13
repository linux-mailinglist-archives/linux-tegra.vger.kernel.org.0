Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E0E21D1AE
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Jul 2020 10:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgGMI1d (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 13 Jul 2020 04:27:33 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7608 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbgGMI1c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Jul 2020 04:27:32 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0c1ae70001>; Mon, 13 Jul 2020 01:27:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 13 Jul 2020 01:27:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 13 Jul 2020 01:27:32 -0700
Received: from [10.26.72.101] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jul
 2020 08:27:30 +0000
Subject: Re: [PATCH] ARM: tegra: Enable CPUFREQ userspace governor
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200712103114.24825-1-jonathanh@nvidia.com>
 <857e47b0-e226-72b7-3855-f668c49c0739@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5f777eab-5584-5e4b-ff81-2a9c6522ddad@nvidia.com>
Date:   Mon, 13 Jul 2020 09:27:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <857e47b0-e226-72b7-3855-f668c49c0739@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594628839; bh=cJCgoFnricOcn3bzznWwtdHU4qFkMXByPEa1hdvgqJs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=KaaqzNyIcPyA1r1+qOkZlZvf277m0jgpQGHNDe9wt8xCU2aFfdsLDU0Cod3ywawss
         8ZEivHFJoWPLPKB6m/Qv7C8MXc6FWLX1YB0QHZCLoHdQY9KulhRiiMvl37cNUdLWkA
         FN9duajY8u0axbaUqxjJClviLiXU+UFOMEcTkAfmxli1fHsBIwmMf5zZOvyjBVXsBx
         XZjM5ONQAmEP6F9f1r3LMKcWsG1cyCnVtdgPhJZbQC4/7gu3XfBaUwn09IBhPBHatI
         EqADovrrbS93ft4gYdxk8le7MuKbVT55EgYC1Hafy5YJU7FbanU9pk8NmykhJa77ZB
         JiGq45kmsRpjQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 12/07/2020 11:48, Dmitry Osipenko wrote:
> 12.07.2020 13:31, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Enable the CPUFREQ userspace governor in the tegra_defconfig so that
>> we can test CPUFREQ with the userspace governor with this configuration
>> on 32-bit Tegra devices.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  The_Yellow_Theme_24-192.wav      | 0
>>  arch/arm/configs/tegra_defconfig | 1 +
>>  2 files changed, 1 insertion(+)
>=20
>>  create mode 100644 The_Yellow_Theme_24-192.wav
>>
>> diff --git a/The_Yellow_Theme_24-192.wav b/The_Yellow_Theme_24-192.wav
>> new file mode 100644
>=20
> Hello, Jon! This looks like something unrelated to this patch :)


Ugh indeed. Thanks. I will fix this. Jon

--=20
nvpublic
