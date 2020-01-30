Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 676CB14DA5A
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 13:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgA3MFL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jan 2020 07:05:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10740 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgA3MFL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jan 2020 07:05:11 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e32c6420000>; Thu, 30 Jan 2020 04:04:19 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jan 2020 04:05:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 04:05:10 -0800
Received: from [10.26.11.91] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 12:05:08 +0000
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
        <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
 <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c01e6e09-d3ed-7c39-5a66-e25950f8bdcc@nvidia.com>
Date:   Thu, 30 Jan 2020 12:05:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580385859; bh=/9Bmi6xFCA2HCBMX72pcjT06pDuYUSf8ufYaT3JncNU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Zjk/0QYF08a1P9Nnh/hrvbc47Sm+28QirdjgsdGPvQkHM6mDU1hwKzoLH7DBku4Nb
         mwrarpuMdRJuCDUzq2NavBab/5gAGwEIobJpA72m57D8xHcBwDHLzwU8FS+Ga+bIS8
         FgBIE6swXk8dBtyn/WDirXkVg6ZpRd+OvPYARl+nmMbD04s5Jl5KHhlNtz2tEiBPem
         5EXAsEFFsFxwULde5MDTQIZ/rY41G1YfuEtdr+naaswLEqopmWn2EiQFLDdhw1Hn7F
         W4XYbAP9Za5JbZQGOuGS/LMA7zo8Jy2RZxuZlJInNUKL84b0uQnupk867gPiPKPrXD
         lCKB3NYxskdbQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 30/01/2020 08:17, Ben Dooks wrote:

...

> I'll be back in the office next week to test.

Any objections to reverting this patch now for v5.6 and pushing to
stable for v5.5, then getting this fixed properly for v5.7?

Jon

-- 
nvpublic
