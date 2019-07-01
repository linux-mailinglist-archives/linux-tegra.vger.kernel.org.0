Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAFBA5C5F8
	for <lists+linux-tegra@lfdr.de>; Tue,  2 Jul 2019 01:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfGAXn0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 1 Jul 2019 19:43:26 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:33386 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfGAXn0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 1 Jul 2019 19:43:26 -0400
Received: from [10.20.204.51] (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 47B2B1C00B5;
        Mon,  1 Jul 2019 17:43:25 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
Subject: Re: [pinmux scripts PATCH 1/3] Update kernel driver template
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org
References: <20190620170055.19771-1-thierry.reding@gmail.com>
From:   Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <82164495-67ba-1ae4-b25a-be0b273ff210@wwwdotorg.org>
Date:   Mon, 1 Jul 2019 17:43:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620170055.19771-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/20/19 11:00 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Some changes in recent years have modified the upstream kernel driver in
> some ways that make it incompatible with the current template. Update
> the template to take into account changes introduced by the following
> commits:

All 3 patches applied.
