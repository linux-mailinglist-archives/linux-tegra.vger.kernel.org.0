Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE63165FCF
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Feb 2020 15:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgBTOg3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Feb 2020 09:36:29 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4009 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbgBTOg2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Feb 2020 09:36:28 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4e99230000>; Thu, 20 Feb 2020 06:35:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 20 Feb 2020 06:36:27 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 20 Feb 2020 06:36:27 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 14:36:24 +0000
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
To:     Sameer Pujar <spujar@nvidia.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <robh+dt@kernel.org>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d7e81ada-9711-647d-3c4f-29dd469c6621@nvidia.com>
Date:   Thu, 20 Feb 2020 14:36:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-4-git-send-email-spujar@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582209315; bh=U31myyW56C4tdiGtd2jJLPSaoyAgelANlRknYewe5kg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Lsp5luzmKreOs7Qi4z4so5RiHORS2xhCjFw9ZcrXLk4RInNCPoyWDdkg1Py4HeIvW
         9myXHWRIKbEryDtXGnYOuM7WfymAzpvN4UofgD3xzNmICq+U4aDGSTxEbjBxwtY2Ia
         JyGKnfQvO7hVCACBtalSZl/vSraTpfezSF9YIzEQrv0g5rEFqI0bYqW/R8C9hL0px6
         8xhNZXGCwCR60LAjl2oawAhD328kayKTQq9dgpoWOjCknO4JcEISJFc0phpoaFio0b
         1HFtmJxl5hrPDnvlmHe4oZApsnTz5VmtSz/MY6Tnxp1HSXAyp9lD+e0FNpjh0gPXXy
         Jiixv66kxZ0bw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 20/02/2020 06:34, Sameer Pujar wrote:
> The Digital MIC (DMIC) Controller is used to interface with Pulse Density
> Modulation (PDM) input devices. The DMIC controller implements a converter
> to convert PDM signals to Pulse Code Modulation (PCM) signals. From signal
> flow perspective, the DMIC can be viewed as a PDM receiver.
> 
> This patch registers DMIC component with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes DMIC interfaces, which can be used to connect different
> components in the ASoC layer. Makefile and Kconfig support is added to
> allow to build the driver. The DMIC devices can be enabled in the DT via
> "nvidia,tegra210-dmic" compatible string. This driver can be used for
> Tegra186 and Tegra194 chips as well.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
