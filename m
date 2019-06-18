Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12D684A593
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 17:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbfFRPhW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 11:37:22 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17592 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728982AbfFRPhW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 11:37:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0905300000>; Tue, 18 Jun 2019 08:37:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 08:37:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 08:37:21 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 15:37:19 +0000
Subject: Re: drm connectors, tegra, and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
CC:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        <linux-tegra@vger.kernel.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3271ab62-43dc-a845-45ff-c3dae62ad2d6@nvidia.com>
Date:   Tue, 18 Jun 2019 16:37:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618151938.GA2567@kroah.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560872240; bh=Us+gh5E3lAh8UN/jbcqp7+7nE/0ieVr1E9V4QmsHeTo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=GmrwIFgwH+np6ACmVfGfrqmH69XbvuKTnNOmbTtZKtgCsruhNBs+OYQFtvHwO8bxb
         K7uzlrG22mxHgcncHS+ofmZgTaWVXndbGezh9HTqOzLGRM2cEHUUHGvxYX0zKo9ihk
         dhmx6rnIMFrzKcxLej/OOBRtgkriWZQLkik9ikYHN0aQ7oj2UEgl9MjIeb7rI7dn81
         gel9FFTtimYJHeAW7T5Oq+VzHgE5FMXUMfvgxkofwarCbrPFl3VXLjOSLyJgpRrGxP
         tb9DmsaE7THy3rayc//QyG5uNbp6Ark9QZLcuiaJad0DTADP09xple2TsJcmSREDz4
         U+FoDzufIkDog==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/06/2019 16:19, Greg Kroah-Hartman wrote:
> On Fri, Jun 14, 2019 at 10:36:14PM +0200, Daniel Vetter wrote:
>> Greg is busy already, but maybe he won't do everything ...
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> ---
>>  Documentation/gpu/todo.rst | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>> index 9717540ee28f..026e55c517e1 100644
>> --- a/Documentation/gpu/todo.rst
>> +++ b/Documentation/gpu/todo.rst
>> @@ -375,6 +375,9 @@ There's a bunch of issues with it:
>>    this (together with the drm_minor->drm_device move) would allow us to remove
>>    debugfs_init.
>>  
>> +- Drop the return code and error checking from all debugfs functions. Greg KH is
>> +  working on this already.
> 
> 
> Part of this work was to try to delete drm_debugfs_remove_files().
> 
> There are only 4 files that currently still call this function:
> 	drivers/gpu/drm/tegra/dc.c
> 	drivers/gpu/drm/tegra/dsi.c
> 	drivers/gpu/drm/tegra/hdmi.c
> 	drivers/gpu/drm/tegra/sor.c
> 
> For dc.c, the driver wants to add debugfs files to the struct drm_crtc
> debugfs directory.  Which is fine, but it has to do some special memory
> allocation to get the debugfs callback to point not to the struct
> drm_minor pointer, but rather the drm_crtc structure.
> 
> So, to remove this call, I need to remove this special memory allocation
> and to do that, I need to somehow be able to cast from drm_minor back to
> the drm_crtc structure being used in this driver.  And I can't figure
> how they are related at all.
> 
> Any pointers here (pun intended) would be appreciated.
> 
> For the other 3 files, the situation is much the same, but I need to get
> from a 'struct drm_minor' pointer to a 'struct drm_connector' pointer.
> 
> I could just "open code" a bunch of calls to debugfs_create_file() for
> these drivers, which would solve this issue, but in a more "non-drm"
> way.  Is it worth to just do that instead of overthinking the whole
> thing and trying to squish it into the drm "model" of drm debugfs calls?
> 
> Either way, who can test these changes?  I can't even build the tegra
> driver without digging up an arm64 cross-compiler, and can't test it as
> I have no hardware at all.

We can definitely compile and boot test these no problem. In fact
anything that lands in -next we will boot test. However, I can do some
quick sanity if you have something to test.

Thierry may have more specific Tegra DRM tests.

Cheers
Jon

-- 
nvpublic
