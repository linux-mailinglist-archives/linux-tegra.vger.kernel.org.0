Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3F0910D4A2
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 12:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfK2LUp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 06:20:45 -0500
Received: from 8bytes.org ([81.169.241.247]:53272 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbfK2LUp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 06:20:45 -0500
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A87503AA; Fri, 29 Nov 2019 12:20:43 +0100 (CET)
Date:   Fri, 29 Nov 2019 12:20:39 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/9] drm/nouveau: Various fixes for GP10B
Message-ID: <20191129112039.GB11039@8bytes.org>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Nov 02, 2019 at 06:56:28PM +0100, Thierry Reding wrote:
> Thierry Reding (9):
>   iommu: Document iommu_fwspec::flags field
>   iommu: Add dummy dev_iommu_fwspec_get() helper

Acked-by: Joerg Roedel <jroedel@suse.de>

