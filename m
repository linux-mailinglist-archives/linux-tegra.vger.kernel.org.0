Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5316E262A77
	for <lists+linux-tegra@lfdr.de>; Wed,  9 Sep 2020 10:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgIIIhR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 9 Sep 2020 04:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgIIIhI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 04:37:08 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A56C061573
        for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2020 01:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Pk2LTrKd0ce3vCvtIx9c6np0i8syA+h7+MF5oX4G0fw=; b=zWdpz9FlYlc6dR8Jq3Jg9TBkFL
        Vf3IA4MdsX9vsNgzCmVHPSwgZIDm8IR1bDjCDXuEe7NGVENGXJA/AFiEQ6+O/8HBbQn/xAxSws5bW
        Y99JgpaEH/VWWMhVx1MZqWBiUpSENpWQZsNGab0wKkIvhclFNw55nJlimELMvNRs2+Y/BnH4Ll5ty
        8u5NDLkrUSgUDRydeug/qwwp192nGjcMps7Q5hGAdZLd26sYovDSMmhacEGWCJTru2BwiKsABGU2S
        fQ74P97u8sNek2VBO5uDGLaPXOmlxpiNPtwHWEd6BVZ58b0ScMfFmSkrGA3D5IambKUpoJE+MhM30
        j+iZeg+Q==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kFvbC-0006fS-FA; Wed, 09 Sep 2020 11:37:02 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
 <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
Date:   Wed, 9 Sep 2020 11:36:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 9/9/20 5:34 AM, Dmitry Osipenko wrote:
> 09.09.2020 05:10, Dmitry Osipenko пишет:
>> 05.09.2020 13:34, Mikko Perttunen пишет:
>>> +	job->timeout = min(args->timeout_us / 1000, 10000U);
>>> +	if (job->timeout == 0)
>>> +		job->timeout = 1;
>>
>> clamp()
>>

Will fix.

> 
> Does it make sense to have timeout in microseconds?
> 

Not sure, but better have it a bit more fine-grained rather than 
coarse-grained. This still gives a maximum timeout of 71 minutes so I 
don't think it has any negatives compared to milliseconds.

Mikko
