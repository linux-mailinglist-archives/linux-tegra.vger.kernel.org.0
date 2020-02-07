Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 002C51556B7
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Feb 2020 12:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgBGLat (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Feb 2020 06:30:49 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2754 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGLat (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Feb 2020 06:30:49 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3d4a5a0000>; Fri, 07 Feb 2020 03:30:34 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Feb 2020 03:30:48 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Feb 2020 03:30:48 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 11:30:42 +0000
CC:     <spujar@nvidia.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>
Subject: Re: [PATCH v2 0/9] add ASoC components for AHUB
To:     Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <fcab0af1-fe84-6028-701b-ab101feaa8de@gmail.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <d17b2654-a888-8251-468d-12ef1451cd4b@nvidia.com>
Date:   Fri, 7 Feb 2020 17:00:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <fcab0af1-fe84-6028-701b-ab101feaa8de@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581075034; bh=iJJohQN1MzcIFrruuAOaFAgWg26u5hXeJo8OvD0C/IA=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=BPbUGl8cBotLr6NBFGL7DoZLNC2WkY65RwgSlEPqMuNudVFx4LB0IJbfuHV/wGFL1
         f4U4/XPrEADNsR1ImEBkYPNsjMjPKsLWfziWN98rIJuMDlvSjEW8Qaz88z0Zcn0seM
         W768k5qp7l/m0sip/qDgRvfOcgEOOTTWv+IDDgKr1Vg6YifGQHImHdr2Y0MaDrRKN2
         /GtVcRPFxs2Akn0iclftkQQ/x/ERYD3W5rrEdTQCbB1h3Z2rjwpahYegoH94p5L40e
         xsgPVclWUE2UJpq3BgC3oyigIgNDYtnic0ZlZ1HCpOi1rL+exgK+K39/yFoBLzG/hJ
         VIa2pO1veFuTA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2/6/2020 11:06 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>   sound/soc/tegra/Kconfig                            |  56 ++
> Probably won't hurt to enable the new drivers in the
> arch/arm64/configs/defconfig?

Do you mean, if drivers can be enabled?

