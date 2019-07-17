Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14DFB6C39D
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Jul 2019 01:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfGQXrz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jul 2019 19:47:55 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:51816 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbfGQXrz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jul 2019 19:47:55 -0400
Received: from [10.20.204.51] (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 1E11A1C03A2;
        Wed, 17 Jul 2019 17:47:55 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
Subject: Re: [cbootimage PATCH] Free image buffer on read error
To:     Jacob Garber <jgarber1@ualberta.ca>
References: <20190717230748.23204-1-jgarber1@ualberta.ca>
Cc:     linux-tegra@vger.kernel.org
From:   Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <33f9be05-f684-92ea-56de-eb1b6c513a42@wwwdotorg.org>
Date:   Wed, 17 Jul 2019 17:47:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717230748.23204-1-jgarber1@ualberta.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 7/17/19 5:07 PM, Jacob Garber wrote:
> Free the buffer after a read error to prevent a memory leak. This was
> flagged by a Coverity scan of the coreboot project, which uses
> cbootimage.

Thanks. Applied.
