Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF4423DC36
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Aug 2020 18:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgHFQrm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Aug 2020 12:47:42 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16765 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729078AbgHFQm6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 12:42:58 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c32ad0000>; Thu, 06 Aug 2020 09:41:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 09:42:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 06 Aug 2020 09:42:57 -0700
Received: from [10.2.172.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 16:42:57 +0000
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
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
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
 <9deaee09-c422-5694-7c19-d85354b9b703@gmail.com>
 <14793e8c-30dc-5cf5-fdf9-6f64fa433818@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <c9709f37-02dd-cd1a-b83f-07784365945d@nvidia.com>
Date:   Thu, 6 Aug 2020 09:42:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14793e8c-30dc-5cf5-fdf9-6f64fa433818@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596732077; bh=iDI3V2L85r1lv2jtVd4uBOO2hPT5n4v0tS3+rooYMIw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=DQTHrTBM0+agMOZIqShyUnF2jKLQnF8Ry58xSDxnuepU0A+VdXYkwov3Ty0JnGiJP
         h/0m/+nLqk/gLLvNgJIfU0GdWJybBe/jnwPDO+pYi0XNbdj5Hw8PGJaEEWmyrOnB/b
         12ewdRLYh9wB8qhGljRRVCRmqmHA2EHDWjTM+6eyQ1uhos7sDdYGvRex7eiG/wvz0g
         ZXkfiL0gVwGET/DJLfjaVe7oDir51HcIsAFaxg/zCRKab6libTN2H40z05dxMbHhni
         1UNDMSruVD16Ru2YuDce2CE20ZaVAP46PbAqYPvZef7Ie+2J72TiwTbOXee78N6Y2V
         DzyrbPOlzqiMA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 8/6/20 9:37 AM, Dmitry Osipenko wrote:
> 06.08.2020 19:13, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 06.08.2020 18:59, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ..
>>> We cant use active status check for specific pads under calibration.
>>> This is common bit for all pads.
>> I'm not sure why this is a problem.
>>
> IIUC, the start_calibration() should wait for the MIPI_CAL_STATUS_ACTIVE
> and finish_calibration() should wait for MIPI_AUTO_CAL_DONE_CSIA/B.

As soon as START bit it set, FSM will set ACTIVE =3D 1

There is no added advantage of waiting for ACTIVE to be in=20
start_calibration()

