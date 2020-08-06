Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8439623E022
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Aug 2020 20:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgHFSHX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Aug 2020 14:07:23 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10588 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgHFSHT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 14:07:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c46a50000>; Thu, 06 Aug 2020 11:06:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 11:07:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Aug 2020 11:07:19 -0700
Received: from [10.2.172.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 18:07:18 +0000
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
 <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
 <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
 <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
 <b5612e93-f1c4-4762-baa1-5d85eb1edbe1@gmail.com>
 <412f8c53-1aca-db31-99a1-a0ecb2081ca5@nvidia.com>
 <61275bd6-58e7-887f-aa7d-8e60895e7b2b@nvidia.com>
 <6ff57c38-9847-42b0-643b-0d167c13779f@gmail.com>
 <c6ef5e77-2b0a-1712-ca58-dbd8d232e1f1@nvidia.com>
 <ed79b201-85ba-f725-c5fa-fcde0761bc3d@nvidia.com>
 <26ed2841-db5d-aeb0-11c7-cbe2ddd1d76b@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <eddfdaf0-818a-c4dd-e3b4-4d432af56982@nvidia.com>
Date:   Thu, 6 Aug 2020 11:07:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <26ed2841-db5d-aeb0-11c7-cbe2ddd1d76b@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596737189; bh=sv4+c3VUgdhY9NyeYY7yjrF5/QPHLa+clVNNxjB/fsg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=T8n9C5xA3wOpIjrClJphuID9+rlVkFxZGQI6dUqxHya9/2ZSS8MOx4oQzKhdCcqDH
         m5g1tvnmjYBcA/JwZDZgtJWWX5SVVArf2PlCBwUlE98Aw1zgKRfYCYpPoNlIKHUi6V
         VCWxyvJ2LBN6PjSNEVAO2E7PddDUKsN8sTcRnRQ0np6bfEW4E63dV5o2k2DSWydCjJ
         tWla0Wulywp7QyUlO+XUZIUjqtjbTApuTYIISRNKXaLlGBlxPcbrvZU/luzcZXIIvm
         xq1RS1zZNZleZ6VBvO9B3NaA6SS/mMy10DlNLQbcJHrNseFktttAfzJkwi2z0qGZcm
         FU1p/chMMtkYg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 8/6/20 11:01 AM, Dmitry Osipenko wrote:
> 06.08.2020 20:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> Right mutex_unlock should happen at end of finish_calibration.
>>
>> With keeping mutex locked in start, we dont have to check for active to
>> be 0 to issue start as mutex will keep it locked and other pads
>> calibration can only go thru when current one is done.
>>
>> So instead of below sequence, its simpler to do this way?
>>
>> start_calibration()
>>
>> - mutex_lock
>>
>> - wait for 72uS after start
>>
>> finish_calibration()
>>
>> - keep check for ACTIVE =3D 0 and DONE =3D 1
> I think only the DONE bits which correspond to the mipi_device->pads
> bitmask should be awaited.

As next START can't be triggered when auto cal is ACTIVE, we should keep=20
this in finish.

As we do mutex_unlock only at end of finish, other pads calibrations=20
dont go thru till the one in process is finished.

So in this case ACTIVE applies to current selected pads that are under=20
calibration.

>
>> - mutex_unlock()
> Perhaps the start_calibration() also needs to be changed to not touch
> the MIPI_CAL_CONFIG bits of the unrelated pads?
Driver already takes care of programming corresponding pads config only.
>
> Otherwise sounds good to me.
