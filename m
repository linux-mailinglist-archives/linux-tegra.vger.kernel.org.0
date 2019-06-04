Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5CD34299
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 11:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfFDJF7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 05:05:59 -0400
Received: from foss.arm.com ([217.140.101.70]:38450 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726873AbfFDJF7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 4 Jun 2019 05:05:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7099A78;
        Tue,  4 Jun 2019 02:05:58 -0700 (PDT)
Received: from e107533-lin.cambridge.arm.com (unknown [10.37.9.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 775CA3F246;
        Tue,  4 Jun 2019 02:05:57 -0700 (PDT)
Date:   Tue, 4 Jun 2019 10:05:54 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: tegra: add CPU cache topology for Tegra186
Message-ID: <20190604090554.GD23250@e107533-lin.cambridge.arm.com>
References: <20190604023535.7115-1-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604023535.7115-1-josephl@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 04, 2019 at 10:35:35AM +0800, Joseph Lo wrote:
> Tegra186 has two CPU clusters with its own cache hierarchy. This patch
> adds them with the cache information of each of the CPUs.
> 

Please add geometry information if you prefer to expose the same to the
user-space. We removed support to read the system registers to fetch
these information. In-fact it was for one of the Tegra platforms that
geometry in those registers don't match the actual values, at-least
that was the argument to drop the support for the same.

--
Regards,
Sudeep
