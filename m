Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2C55E88E9
	for <lists+linux-tegra@lfdr.de>; Sat, 24 Sep 2022 09:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbiIXHFM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 24 Sep 2022 03:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiIXHFL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 24 Sep 2022 03:05:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0280C7F0B7
        for <linux-tegra@vger.kernel.org>; Sat, 24 Sep 2022 00:05:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 86D7860AC7
        for <linux-tegra@vger.kernel.org>; Sat, 24 Sep 2022 07:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCD7C433C1;
        Sat, 24 Sep 2022 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664003109;
        bh=j3pCRGDyqypnws5dBa/VSjNqPWmVl/HIOplifhM66RM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tIT+Ii/DSq9ts4Bu0MG2R25MMiVlvQy+Lzy/WM+b9eF1/kvMinvdF9Clm0Ho5v3fK
         0AhngUkAEHz3+0NM8eJ9vs8kx4WhRQjopOw4X49x9j91grZC1cyLK2LKmDyku7k3NP
         rlLURXmMLMAX8vxFpDiMItOjrv0FslaKp4K0otNBgUtZqVl+SuHPXF8whrC+aTfj8P
         kaojUdbS6mh+G0TyMHVOFf0cVncSyZ7jX+6tIj5G2WdcEd3sIc1VMJjFcWLIMRG5/q
         v8GjPVJFkiTk2BpkI87F08tpe0mLD7KdvATIDEQ8bcl4Bc/SQgkG6dIiFIsxUw5WCQ
         nHENjNTj/0rOw==
Date:   Sat, 24 Sep 2022 12:35:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yuan Can <yuancan@huawei.com>
Cc:     jckuo@nvidia.com, kishon@ti.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: xusb: Use dev_err_probe() to simplify code
Message-ID: <Yy6sIaNKZhwsnEbl@matsya>
References: <20220922092243.22281-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922092243.22281-1-yuancan@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22-09-22, 09:22, Yuan Can wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.

Applied, thanks

-- 
~Vinod
