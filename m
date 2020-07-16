Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694AE222670
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 17:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgGPPF0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 11:05:26 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:3294 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPPFZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 11:05:25 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f106c420000>; Thu, 16 Jul 2020 08:03:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 Jul 2020 08:05:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 Jul 2020 08:05:25 -0700
Received: from [10.2.55.46] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Jul
 2020 15:05:25 +0000
Subject: Re: [PATCH] arm64: tegra: Add the GPU on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, Debarshi Dutta <ddutta@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716120138.532906-1-thierry.reding@gmail.com>
 <3748e071-4d08-8e77-43f6-de37f5a7eb1e@nvidia.com>
 <20200716131753.GG535268@ulmo>
X-Nvconfidentiality: public
From:   Terje Bergstrom <tbergstrom@nvidia.com>
Message-ID: <4f9cfab5-2a5d-379c-ba17-1aca896b4110@nvidia.com>
Date:   Thu, 16 Jul 2020 08:05:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716131753.GG535268@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594911810; bh=1m4MBOQmGuqn1yj+3sBKAAhi5L6A2ySqJ2jLxgF5xwo=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Transfer-Encoding:Content-Language;
        b=CwxJwhU0Ipe0RKk5/SH2IKx9pXuK2dkpXLu3F482UOuHmXnnXrY0TMTK+v0oW15qQ
         ota/KTCAsCypP0ChUgkBQXumCRBx4+x4Uh4e4/aJ2ccKr+m+djkLJwSSJAkxvk1MkU
         5faZlJ+p0hRiJpNbrEKOWeLihTEGSx/poMwUOVtqKIAMEmmRPHLWy/THm6ufmEdMYY
         6yRzGKNDti/vusXJQFv7KSBuuJJ+BncKbus+II4hn7KFJ1yybXHEozXS4mQART0zXw
         fvIag38Xc2DsXrxqE9P9Yv3OHrCPWOqUcQ4abcnkV0CK4xmu034kTAfI4w6KW1Pzhs
         r1ExPv7Llxe0A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 7/16/2020 6:17 AM, Thierry Reding wrote:
> On Thu, Jul 16, 2020 at 01:59:33PM +0100, Jon Hunter wrote:
>> I also see that for gv11b we populate 'dma-coherent' and so we should
>> probably add this as well.
> Do we know for certain that the GPU is DMA coherent? I've only tested
> this (with local patches to Nouveau) without dma-coherent, so I have not
> actually verified that it works without.
>
> I vaguely recall reading that there are different apertures for sysmem,
> one for coherent sysmem and another for non-coherent sysmem. So I'm not
> sure if dma-coherent here will work without additional code in the
> driver to ensure that all memory is allocated from the coherent sysmem
> aperture.

We do have the choices of coherent and non-coherent memory accesses in 
the iGPU via the two sysmem apertures. But in Tegra194 we're forcing 
coherency from the memory subsystem side, so all accesses are coherent.

Terje
