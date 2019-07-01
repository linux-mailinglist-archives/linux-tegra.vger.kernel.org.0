Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D16F34583
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 13:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfFDLfN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 07:35:13 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15548 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727239AbfFDLfM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 07:35:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf6576e0000>; Tue, 04 Jun 2019 04:35:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Jun 2019 04:35:11 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Jun 2019 04:35:11 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Jun
 2019 11:35:11 +0000
Received: from [10.26.11.158] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Jun 2019
 11:35:08 +0000
Subject: Re: [PATCH 07/26] iommu/dma: move the arm64 wrappers to common code
To:     Christoph Hellwig <hch@lst.de>
CC:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        <iommu@lists.linux-foundation.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20190422175942.18788-1-hch@lst.de>
 <20190422175942.18788-8-hch@lst.de>
 <06b331f0-7df7-a6cd-954c-789f89a0836d@arm.com>
 <acb46c7f-0855-de30-485f-a6242968f947@nvidia.com>
 <20190604060554.GA14536@lst.de>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5e119919-bbfd-14a4-0258-93e8249d11c4@nvidia.com>
Date:   Tue, 4 Jun 2019 12:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604060554.GA14536@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559648110; bh=VdqCX9RhIKbSosQO8ZrtJXPmMRZiVMAZh+LN9yQt9Zk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=emCZJ7it6lQS53IGu3TzNnekDYJaA//l1h7EaXgGok72LlXH4v9jhBAOGQz59yBV4
         uYLIm9wA8pSFenLXo9wX7QKjEjv1kcJRtovDerKh6hs3he51kpHfqrKB19qfA8gG2N
         Y37awIOpATCkodK1yiiLnWKsYxhHzIPMofESI5qT+J2Pu+7R+6uDdYfIRE3tHij3LC
         wuYTsm1vWBrKeeJ3WgBQkWNLGs1mOxBO/NnkHfhYBVTqVNVhwNh3Eg49AVRVUD9SIR
         Uzr4wK1ElNJox0xa4xVXPelS4UcglZJJ7ebbiM61sRgdQ84RBEMjJqexYIaLMth4JY
         Lh71EqBvSMgrw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 04/06/2019 07:05, Christoph Hellwig wrote:
> On Mon, Jun 03, 2019 at 08:47:57PM +0100, Jon Hunter wrote:
>> Since next-20190529 one of our tests for MMC has started failing, where
>> the symptom is that the data written to the MMC does not match the
>> source. Bisecting this is pointing to this commit. Unfortunately, I am
>> not able to cleanly revert this on top of -next, but wanted to report
>> this if case you have any ideas.
> 
> Does this fix your problem?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/commit/?h=generic-dma-ops&id=1b961423158caaae49d3900b7c9c37477bbfa9b3

Yes I can confirm with this patch on today's -next the issue is no
longer seen, and reverting this patch on top of today's -next causes the
problem to occur again. So yes this fixes my problem.

Thanks!
Jon

-- 
nvpublic
