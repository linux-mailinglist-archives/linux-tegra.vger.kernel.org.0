Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE95E44FB
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Oct 2019 09:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437462AbfJYH6P (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Oct 2019 03:58:15 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14783 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437461AbfJYH6P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Oct 2019 03:58:15 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db2ab1c0000>; Fri, 25 Oct 2019 00:58:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 25 Oct 2019 00:58:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 25 Oct 2019 00:58:15 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 07:58:15 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 07:58:12 +0000
Subject: Re: [PATCH v5 5/7] ASoC: tegra: set i2s_offset to 0 for tdm
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-6-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6711e8de-cff1-2307-eab5-59029c0a41c3@nvidia.com>
Date:   Fri, 25 Oct 2019 08:58:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-6-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571990300; bh=za3ZhMUIqYweQASAyVE3CSXYj1cLYnhMpqE8HyiR3sw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=L6q5dymZvQARawD30M3q93Os9IsuDKBU+Rhinb3GrxDyGaSKLwnChIDEkhcXvOSr4
         Lw0TxKNjvGDlTVTZT9eIIxAhO3iXXqgOsdtvHNlpttRfO9ghCNfEVDDVS624a8xf4U
         KeUi3cOcGaZDR1B/ZA5q1Oys1gI8rCj+3mwOim736F3oM+CEQWv6bynD23gGRK+B+B
         PF8PZh1d6mmvwtCEEEmIPLWti0tF/nMXbnq0q7jNOWs/r7VcKD9woEFpVxeuSVE54h
         MWyH6WASIbpi6nNpxN2eOh75vLf2+ohA6H88df6aCq1mC0J7JVBs8HJvrl3uLr99y3
         MfDRDiMT4BWWQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/10/2019 16:48, Ben Dooks wrote:
> Set the offset to 0 for TDM mode, as per the current setup. Note we also

Minor note, that really it is just DSPB mode and not TDM in general.
Furthermore, my understanding is that both DSPB and LEFT_J modes have a
0 bit delay and the rest have a 1 bit delay.

Cheers
Jon

-- 
nvpublic
