Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F68215A28
	for <lists+linux-tegra@lfdr.de>; Mon,  6 Jul 2020 17:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729384AbgGFPBG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 Jul 2020 11:01:06 -0400
Received: from mga04.intel.com ([192.55.52.120]:25978 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729197AbgGFPBG (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 6 Jul 2020 11:01:06 -0400
IronPort-SDR: hBdLNDZoHhjxPDCwyH6WCLAVB5bXxR1Y/sNDtSdh2IjXxtBZUDqk9EIPqMAPY9ciw2U40F+BIk
 GR0/uDfn6M+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="144931809"
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; 
   d="scan'208";a="144931809"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2020 08:01:05 -0700
IronPort-SDR: +vpazag5h9NFqzMeig/fARcURoClfchVzLi7o//zaDevGgoHM+ZHjMU0IFuM4npR/dFu61cflc
 n/xFFyy/gD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; 
   d="scan'208";a="313985346"
Received: from djiang5-mobl1.amr.corp.intel.com (HELO [10.212.168.148]) ([10.212.168.148])
  by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 08:01:04 -0700
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
To:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     linux-serial@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>, jirislaby@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ldewangan@nvidia.com, Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, Qian Cai <cai@lca.pw>,
        lkft-triage@lists.linaro.org
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
 <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
From:   Dave Jiang <dave.jiang@intel.com>
Message-ID: <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd@intel.com>
Date:   Mon, 6 Jul 2020 08:01:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 7/6/2020 5:53 AM, Arnd Bergmann wrote:
> On Mon, Jul 6, 2020 at 1:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> While booting qemu_arm64 and qemu_arm with Linux version 5.8.0-rc3-next-20200706
>> the kernel panic noticed due to kernel NULL pointer dereference.
>>
>> metadata:
>>    git branch: master
>>    git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>    git commit: 5680d14d59bddc8bcbc5badf00dbbd4374858497
>>    git describe: next-20200706
>>    make_kernelversion: 5.8.0-rc3
>>    kernel-config:
>> https://builds.tuxbuild.com/Glr-Ql1wbp3qN3cnHogyNA/kernel.config
>>
>> qemu arm64 boot crash log,
>>
>> [    0.972053] Unable to handle kernel NULL pointer dereference at
>> virtual address 0000000000000000
>> [    0.975301] Mem abort info:
>> [    0.976316]   ESR = 0x96000004
>> [    0.977378]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    0.979363]   SET = 0, FnV = 0
>> [    0.980458]   EA = 0, S1PTW = 0
>> [    0.981583] Data abort info:
>> [    0.982634]   ISV = 0, ISS = 0x00000004
>> [    0.984213]   CM = 0, WnR = 0
>> [    0.985260] [0000000000000000] user address but active_mm is swapper
>> [    0.987600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>> [    0.989557] Modules linked in:
>> [    0.990671] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
>> 5.8.0-rc3-next-20200706 #1
>> [    0.993711] Hardware name: linux,dummy-virt (DT)
>> [    0.995708] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
>> [    0.998168] pc : pl011_dma_probe+0x90/0x360
> 
> This is the code from you vmlinux file:
> 
> ffff8000107233e4:       b90087e2        str     w2, [sp, #132]
> ffff8000107233e8:       97fcf14c        bl      ffff80001065f918
> <dma_request_chan>
> ffff8000107233ec:       aa0003f4        mov     x20, x0
> ffff8000107233f0:       b140041f        cmn     x0, #0x1, lsl #12
> ffff8000107233f4:       54000488        b.hi    ffff800010723484
> <pl011_dma_probe+0x11c>  // b.pmore
> ffff8000107233f8:       f9400280        ldr     x0, [x20]
> ffff8000107233fc:       f9409c02        ldr     x2, [x0, #312]
> ffff800010723400:       b4000082        cbz     x2, ffff800010723410
> <pl011_dma_probe+0xa8>
> 
> It's the "ldr     x0, [x20]" dereferencing 'chan' in pl011_dma_probe() after
> checking it for an error value. However it's a NULL pointer, not an
> error pointer, indicating that there is a bug in the dmaengine driver
> that you use here, or in the dmaengine core code.

Arnd,
I'm looking at the pl001_dma_probe(), I think we could make it more robust if it 
uses IS_ERR_OR_NULL(chan) instead of IS_ERR(). Should I send a patch for it? I 
suppose looking at the comment header for dma_request_chan() it does say return 
chan ptr or error ptr. Sorry I missed that.


Vinod,
It looks like the only fix for dmaengine for the patch is where Arnd pointed out 
as far as I can tell after auditing it. Let me know how you want to handle this. 
Thanks!

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 0d6529eff66f..48e159e83cf5 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -852,7 +852,7 @@ struct dma_chan *dma_request_chan(struct device *dev, const 
char *name)
         mutex_lock(&dma_list_mutex);
         if (list_empty(&dma_device_list)) {
                 mutex_unlock(&dma_list_mutex);
-               return NULL;
+               return ERR_PTR(-ENODEV);
         }

         list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {


> 
> I don't see anything suspicious in dmaengine drivers, but there is a
> recent series
> from Dave Jiang that might explain it. Could you try reverting  commit
> deb9541f5052 ("dmaengine: check device and channel list for empty")?
> 
> I think the broken change is this one:
> 
> @@ -819,6 +850,11 @@ struct dma_chan *dma_request_chan(struct device
> *dev, const char *name)
> 
>          /* Try to find the channel via the DMA filter map(s) */
>          mutex_lock(&dma_list_mutex);
> +       if (list_empty(&dma_device_list)) {
> +               mutex_unlock(&dma_list_mutex);
> +               return NULL;
> +       }
> +
>          list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {
>                  dma_cap_mask_t mask;
>                  const struct dma_slave_map *map = dma_filter_match(d,
> name, dev);
> 
> which needs to return an error code like -ENODEV instead of NULL. There
> may be other changes in the same patch that introduce the same bug
> elsewhere.
> 
>       Arnd
> 
